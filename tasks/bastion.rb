# frozen_string_literal: true

# Contains logic for enabling, and disabling the Bastion server
class Bastion < Thor
  require './tasks/utils'
  include Utils
  include VlabI18n

  desc I18n.t('bastion.enable.usage'), I18n.t('bastion.enable.desc')
  def enable
    # Do not I18n this string. It is not user facing
    # Do not alter the indentation, or spacing either.
    append_bastion_if_needed
    invoke 'config:set', [], { config_key: 'bastion.enable', value: true }
    server_address = ask(I18n.t('bastion.in.serveraddress'))
    unless server_address.nil?
      manual_invoke 'config:set', { config_key: 'bastion.server_address',
                                 value: server_address,
                                 config_dir: options[:config_dir] }
    end
    say I18n.t('bastion.enable.out.done').green
  end

  desc I18n.t('bastion.disable.usage'), I18n.t('bastion.disable.desc')
  def disable
    inventory = File.readlines('inventory')
    output_lines = inventory.reject { |x| INVENTORY_TAG.split(/\n/).include? x.chomp }
    File.open('inventory', 'w') do |f|
      output_lines.each do |line|
        f.write line
      end
    end
    invoke 'config:set', [], { config_key: 'bastion.enable', value: false }
    say I18n.t('bastion.disable.out.success').green
  end

  no_commands do
    def append_bastion_if_needed
      inventory_tag = <<~INVENTORY
        [bastion]
        bastion
      INVENTORY
      already_done = File.read('inventory').include? 'bastion'
      say I18n.t('bastion.enable.out.alreadyininventory').light_blue if already_done
      File.write('inventory', inventory_tag, File.size('inventory'), mode: 'a') unless already_done
    end
  end
end
