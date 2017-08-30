# frozen_string_literal: true

module ElasticInfra
  # Common DirectorBootstrap module
  module DirectorBootstrapBase
    def bootstrap_template
      return nil if config[:bootstrap_template] == '__no_template__'
      config[:bootstrap_template] || @default_template
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
