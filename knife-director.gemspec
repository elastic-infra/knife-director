# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'knife/director/version'

Gem::Specification.new do |spec|
  spec.name          = 'knife-director'
  spec.version       = Knife::Director::VERSION
  spec.authors       = ['limitusus']
  spec.email         = ['limit.usus@gmail.com']

  spec.summary       = 'knife role manager'
  spec.description   = 'Manages roles in chef-server'
  spec.homepage      = 'https://github.com/elastic-infra/knife-director'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'chef', '>= 12.2.1'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0'
  spec.add_dependency 'knife-zero'
  spec.add_dependency 'knife-windows'
  spec.add_dependency 'knife-bootstrap-resolver'
end
