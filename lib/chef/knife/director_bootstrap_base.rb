# frozen_string_literal: true

module ElasticInfra
  # Common DirectorBootstrap module
  module DirectorBootstrapBase
    def bootstrap_template
      return nil if config[:bootstrap_template] == '__no_template__'
      config[:bootstrap_template] || @default_template
    end
  end
end
