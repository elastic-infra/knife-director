# frozen_string_literal: true

require 'chef/knife'
require 'chef/knife/bootstrap'
require 'chef/knife/bootstrap_resolver'
require 'chef/knife/director_bootstrap_base'

module ElasticInfra
  # knife bootstrap wrapper for Linux
  class DirectorBootstrapLinux < Chef::Knife::Bootstrap
    # Wraps like:
    # sudo -E knife bootstrap \
    #   --why-run \
    #   host0001 -N host0001 \
    #   -E production \
    #   -t linux
    DEFAULT_TEMPLATE = 'linux'

    include DirectorBootstrapBase

    deps do
      Chef::Knife::Bootstrap.load_deps
    end

    banner 'knife director bootstrap linux ' \
           '[SSH_USER@]HOSTNAME -E ENVIRONMENT [options]'

    self.options = Bootstrap.options.merge(options)

    def initialize(argv = [])
      @default_template = DEFAULT_TEMPLATE
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
      config[:bootstrap_template] = bootstrap_template
      super
    end
  end
end
