# frozen_string_literal: true

# Contains tasks and logic for adding a package to vivumlab
class AddPkg < Thor
  require_relative './utils'
  require 'fileutils'
  include Utils
  include VlabI18n

  desc I18n.t('pkg.add.usage'), I18n.t('pkg.add.desc')
  def new
    gather_data
    create_role_folder
    edit_role_tasks
    copy_doc_template
    edit_doc_file
    add_docs_to_docusaurus
    add_service_to_group_vars_all
    add_to_config_template
    FileUtils.chown_R '1000', '1000', '/data'
  end

  no_commands do
    def config_block(to_insert)
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

    def gather_data
      say I18n.t('addpkg.step1').light_blue
      @package_name = ask I18n.t('addpkg.package_name')
      @package_file_name = @package_name.downcase.gsub(/ /, '')
      @package_url = ask I18n.t('addpkg.package_url')
      @package_one_liner = ask I18n.t('addpkg.one_liner')
      say I18n.t('addpkg.done').green
    end

    def create_role_folder
      say I18n.t('addpkg.step2').light_blue
      FileUtils.copy_entry 'package_template/roles/template', "roles/#{@package_file_name}"
      say I18n.t('addpkg.done').green
    end

    def edit_role_tasks
      say I18n.t('addpkg.step3').light_blue
      search_and_replace_in_file("roles/#{@package_file_name}/tasks/main.yml", 'pkgtemplate', @package_file_name)
      FileUtils.mv "roles/#{@package_file_name}/templates/docker-compose.template.yml.j2",
                   "roles/#{@package_file_name}/templates/docker-compose.#{@package_file_name}.yml.j2"
      search_and_replace_in_file("roles/#{@package_file_name}/templates/docker-compose.#{@package_file_name}.yml.j2",
                                 'PackageFileName', @package_file_name)
      `git add roles/#{@package_file_name}`
      say I18n.t('addpkg.done').green
    end

    def copy_doc_template
      say I18n.t('addpkg.step4').light_blue
      FileUtils.copy_entry 'package_template/docs/software/template.md', "website/docs/software/#{@package_file_name}.md"
      say I18n.t('addpkg.done').green
    end

    def edit_doc_file
      say I18n.t('addpkg.step5').light_blue
      search_and_replace_in_file("website/docs/software/#{@package_file_name}.md", 'PackageURL', @package_url.to_s)
      search_and_replace_in_file("website/docs/software/#{@package_file_name}.md", 'PackageOneLiner', @package_one_liner.to_s)
      search_and_replace_in_file("website/docs/software/#{@package_file_name}.md", 'PackageFileName', @package_file_name.to_s)
      search_and_replace_in_file("website/docs/software/#{@package_file_name}.md", 'PackageTitleCase', @package_name.to_s)
      `git add website/docs/software/#{@package_file_name}.md`
      say I18n.t('addpkg.done').green
    end

    def add_docs_to_docusaurus
      say I18n.t('addpkg.step6').light_blue
      insert_into_sidebar "\"software/#{@package_file_name}\","
      `git add website/sidebars.js`
      say I18n.t('addpkg.done').green
    end

    def add_service_to_group_vars_all
      say I18n.t('addpkg.step7').light_blue
      add_to_hash_at_key('group_vars/all', ['services'], { @package_file_name.to_s => nil })
      insert_service_name_into_group_vars_second_instance(@package_file_name)
      `git add group_vars/all`
      say I18n.t('addpkg.done').green
    end

    def add_to_config_template
      say I18n.t('addpkg.step8').light_blue
      insert_new_service_in_config_template 'roles/vivumlab_config/templates/config.yml', @package_file_name # to_insert
      `git add roles/vivumlab_config/templates/config.yml`
      say I18n.t('addpkg.done').green
    end

    def search_and_replace_in_file(filepath, search_for, replace_with)
      IO.write(filepath, File.open(filepath) do |f|
        f.read.gsub(search_for, replace_with)
      end)
    rescue StandardError
      say I18n.t('addpkg.failedsandr').red
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

        lines.insert index, config_block(to_insert)
      end
      File.open(filename, 'w+') do |f|
        f.puts(lines)
      end
    end

    def find_name_index_for_next_service_in_sidebar(to_add)
      ordered = IO.foreach('website/sidebars.js')
                  .select { |line| line[%r{software/}] }
                  .map { |line| line.strip.chomp }
      ordered.push to_add
      index = ordered.sort.find_index(to_add)
      ordered[index]
    end

    def insert_into_sidebar(to_insert)
      next_name = find_name_index_for_next_service_in_sidebar to_insert
      lines = File.readlines 'website/sidebars.js'
      lines.dup.each_with_index do |line, index|
        next unless line.strip == next_name

        to_insert = "        #{to_insert}"
        lines.insert index, to_insert
      end
      File.open('website/sidebars.js', 'w+') do |f|
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
end
