# frozen_string_literal: true

require 'chef/knife'
require 'chef/knife/bootstrap'
require 'chef/knife/bootstrap_resolver'

module ElasticInfra
  class DirectorBootstrapLinux < Chef::Knife::Bootstrap
    # Wraps like:
    # sudo -E knife bootstrap \
    #   --why-run \
    #   host0001 -N host0001 \
    #   -E production \
    #   -t linux
    deps do
      Chef::Knife::Bootstrap.load_deps
    end

    banner "knife director bootstrap linux [SSH_USER@]HOSTNAME -E ENVIRONMENT [options]"

    self.options = Bootstrap.options.merge(self.options)

    def initialize(argv = [])
      super
    end

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
        config[:bootstrap_template] ||= 'linux'
      end
      super
    end
  end
end
