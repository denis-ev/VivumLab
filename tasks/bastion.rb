# frozen_string_literal: true

# Contains logic for enabling, and disabling the Bastion server
class Bastion < Thor

  desc I18n.t('bastion.enable.name'), I18n.t('bastion.enable.desc')
  def enable
    # Do not I18n this string. It is not user facing
    # Do not alter the indentation, or spacing either.
    inventory_tag = <<-INVENTORY
[bastion]
bastion
    INVENTORY
    already_done = File.read('inventory').include? 'bastion'
    say 'Bastion already present in Inventory file'.light_blue if already_done
    File.write('inventory', inventory_tag, File.size('inventory'), mode: 'a') unless already_done

  end

  desc I18n.t('bastion.disable.name'), I18n.t('bastion.disable.desc')
  def disable
    say "not yet implemented"
  end
end
