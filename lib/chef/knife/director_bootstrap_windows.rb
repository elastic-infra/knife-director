# frozen_string_literal: true

require 'chef/knife'
require 'chef/knife/bootstrap_windows_winrm'

module ElasticInfra
  class DirectorBootstrapWindows < Chef::Knife::BootstrapWindowsWinrm
    # Wraps like:
    # sudo -E knife bootstrap \
    #   --why-run \
    #   host0001 -N host0001 \
    #   -E production \
    #   --bootstrap-template windows
    deps do
      Chef::Knife::BootstrapWindowsWinrm.load_deps
    end

    banner "knife director bootstrap windows [SSH_USER@]HOSTNAME [options]"

    self.options = BootstrapWindowsWinrm.options.merge(self.options)

    def run
      unless config[:environment]
        puts 'You must specify environment other than _default'
        show_usage
        exit 1
      end
      target_hostname = name_args[0].gsub(/.*@/, '')
      config[:chef_node_name] ||= target_hostname
      if config[:bootstrap_template] == '__no_template__'
        config[:bootstrap_template] = nil
      else
        config[:bootstrap_template] ||= 'windows'
      end
      super
    end
  end
end
