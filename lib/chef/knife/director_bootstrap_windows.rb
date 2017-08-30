# frozen_string_literal: true

require 'chef/knife'
require 'chef/knife/bootstrap_windows_winrm'

module ElasticInfra
  # knife bootstrap wrapper for Windows
  class DirectorBootstrapWindows < Chef::Knife::BootstrapWindowsWinrm
    # Wraps like:
    # sudo -E knife bootstrap \
    #   --why-run \
    #   host0001 -N host0001 \
    #   -E production \
    #   --bootstrap-template windows
    DEFAULT_TEMPLATE = 'windows'

    include DirectorBootstrapBase

    deps do
      Chef::Knife::BootstrapWindowsWinrm.load_deps
    end

    banner 'knife director bootstrap windows ' \
           '[SSH_USER@]HOSTNAME [options]'

    self.options = BootstrapWindowsWinrm.options.merge(options)

    def initialize(argv = [])
      @default_template = DEFAULT_TEMPLATE
      super
    end
  end
end
