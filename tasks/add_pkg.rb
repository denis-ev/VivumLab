# frozen_string_literal: true

# Contains tasks and logic for adding a package to vivumlab
class Pkg < Thor
  require_relative './utils'
  include Utils
  include VlabI18n

  desc I18n.t('pkg.add.usage'), I18n.t('pkg.add.desc')
  def new
    gather_data
    create_role_folder
  end

  no_commands do
    def gather_data
      say 'Step 1, Gathering info'.light_blue
      @package_name = ask 'Enter the package name in Title Case'
      @package_file_name = package_name.downcase.gsub(/ /, '')
      @package_url = ask 'Enter the package URL'
      @package_one_liner = ask 'Enter one-liner package description'
      say 'Done!'.green
    end

    def create_role_folder
      say 'Step 2. Creating role folder'.light_blue
      FileUtils.copy_entry 'package_template/roles/template', "roles/#{@package_file_name}"
      puts 'Done!'.green
    end

    def edit_role_tasks
      say 'Step 3. Editing role tasks and renaming docker-compose template'.light_blue
      search_and_replace_in_file("roles/#{package_file_name}/tasks/main.yml", 'pkgtemplate', package_file_name)
      FileUtils.mv "roles/#{package_file_name}/templates/docker-compose.template.yml.j2",
                   "roles/#{package_file_name}/templates/docker-compose.#{package_file_name}.yml.j2"
      search_and_replace_in_file("roles/#{package_file_name}/templates/docker-compose.#{package_file_name}.yml.j2",
                                 'PackageFileName', package_file_name)
      `git add roles/#{package_file_name}`
      say 'Done!'.green
    end

    def copy_doc_template
      say 'Step 4. Copying doc template'.light_blue
      FileUtils.copy_entry 'package_template/docs/software/template.md', "website/docs/software/#{package_file_name}.md"
      say 'Done!'.green
    end

    def editing_doc_file
      say 'Step 5. Editing doc file'.light_blue
      search_and_replace_in_file("website/docs/software/#{package_file_name}.md", 'PackageURL', package_url.to_s)
      search_and_replace_in_file("website/docs/software/#{package_file_name}.md", 'PackageOneLiner', package_one_liner.to_s)
      search_and_replace_in_file("website/docs/software/#{package_file_name}.md", 'PackageFileName', package_file_name.to_s)
      search_and_replace_in_file("website/docs/software/#{package_file_name}.md", 'PackageTitleCase', package_name.to_s)
      `git add docs/software/#{package_file_name}.md`
      puts 'Done!'.green
    end

    def add_docs_to_docusaurus
      say 'Step 6. Adding docs to docusaurus'.light_blue
      add_to_array_at_key('mkdocs.yml', ['nav', 6, 'Included Software', 16, 'Misc/Other'],
                          { package_name.to_s => "software/#{package_file_name}.md" })
      `git add mkdocs.yml`
      say 'Done!'.green
    end

    def add_service_to_inventory
      puts 'Step 7. Adding service to Inventory file'.light_blue
      add_to_hash_at_key('group_vars/all', ['services'], { package_file_name.to_s => nil })
      insert_service_name_into_group_vars_second_instance(package_file_name)
      `git add group_vars/all`
      puts 'Done!'.green
    end

    def add_to_config_template
      puts 'Step 8. Adding service to Config Template'.light_blue
      insert_new_service_in_config_template 'roles/vivumlab_config/templates/config.yml', package_file_name # to_insert
      `git add roles/vivumlab_config/templates/config.yml`
      puts 'Done!'.green
    end

    #####

    def search_and_replace_in_file(filepath, search_for, replace_with)
      IO.write(filepath, File.open(filepath) do |f|
        f.read.gsub(search_for, replace_with)
      end)
    rescue StandardError
      say 'Failed to execute sarch and replace in file'.red
    end

    def add_to_array_at_key(ymlfile, key, to_append)
      yml = Psych.load_file ymlfile
      yml.dig(*key) << to_append
      File.write ymlfile, Psych.dump(yml)
    rescue StandardError
      p "Failed to add to array at key: #{ymlfile}, #{key}, #{to_append}"
    end

    def add_to_hash_at_key(ymlfile, key, to_append)
      yml = Psych.load_file ymlfile
      yml.dig(*key).merge!(to_append)
      yml[key.first] = yml[key.first].sort.to_h
      File.write ymlfile, Psych.dump(yml)
    rescue StandardError
      p "Failed to add to hash at key: #{ymlfile}, #{key}, #{to_append}"
    end

    def array_of_services
      yml = Psych.load_file 'group_vars/all'
      yml['services']
    end

    def find_name_index_for_next_service(to_add)
      ordered = array_of_services.keys
      ordered.push to_add
      index = ordered.sort.find_index(to_add)
      ordered[index + 1]
    end

    def insert_service_name_into_group_vars_second_instance(to_insert)
      next_name = find_name_index_for_next_service to_insert
      service_name = "#{to_insert}:"
      filename = 'group_vars/all'
      lines = File.readlines filename
      first_instance_found = false
      lines.dup.each_with_index do |line, index|
        next unless line.strip == "#{next_name}:"

        if first_instance_found
          lines.insert index, service_name
        else
          first_instance_found = true
        end
      end
      File.open(filename, 'w+') do |f|
        f.puts(lines)
      end
    end

    def insert_new_service_in_config_template(filename, to_insert)
      next_name = find_name_index_for_next_service to_insert
      lines = File.readlines filename
      lines.dup.each_with_index do |line, index|
        next unless line.strip == "#{next_name}:"

        lines.insert index, config_block
      end
      File.open(filename, 'w+') do |f|
        f.puts(lines)
      end
    end

    def insert_in_config(filename, start_tag, to_insert)
      lines = File.readlines filename
      start_tag_found = false
      lines.dup.each_with_index do |l, i|
        if start_tag_found
          if ((to_insert <=> l) == -1) && ((to_insert <=> lines[i - 1]) == 1)
            lines.insert i, to_insert
            break
          end
        elsif l =~ /#{start_tag}/
          start_tag_found = true
        end
      end
      File.open(filename, 'w+') { |f| f.puts(lines) }
    end
  end

  def config_block
    <<~CONFIG
      #{to_insert}:
        enable: {{ #{to_insert}.enable | default(enable_#{to_insert}, None) | default(False) }}
        hsts: {{ #{to_insert}.hsts | default(True) }}
        auth: {{ #{to_insert}.auth | default(False) }}
        domain: {{ #{to_insert}.domain | default(False) }}
        subdomain: {{ #{to_insert}.subdomain | default("#{to_insert}")}}
        version: {{ #{to_insert}.version | default("latest") }}
        amd64: False
        arm64: False
        armv7: False
    CONFIG
  end
end
