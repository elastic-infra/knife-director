# frozen_string_literal: true

require 'spec_helper'
require 'chef/knife/director_bootstrap_windows'

RSpec.describe ElasticInfra::DirectorBootstrapWindows do
  let(:bs) {
    ElasticInfra::DirectorBootstrapWindows.new
  }

  it 'can be initialized as a Chef::Knife instance' do
    expect(bs).to be_a Chef::Knife
  end

  describe '#bootstrap_template' do
    it 'returns nil for __no_template__' do
      bs.config[:bootstrap_template] = '__no_template__'
      expect(bs.bootstrap_template).to eq nil
    end

    it 'returns linux if nothing passed' do
      bs.config[:bootstrap_template] = nil
      expect(bs.bootstrap_template).to eq 'windows'
    end

    it 'returns the template name if passed' do
      bs.config[:bootstrap_template] = 'foo'
      expect(bs.bootstrap_template).to eq 'foo'
    end
  end

  describe '#run' do
    context 'without environment' do
      it 'prints usage and exit' do
        bs.config[:environment] = nil
        allow(bs).to receive(:show_usage).once
        expect {
          expect {
            bs.run
          }.to output(/You must specify environment/).to_stdout
        }.to raise_error SystemExit
      end
    end

    context 'with environment' do
      before :each do
        bs.config[:environment] = 'test'
      end

      context 'with hostname' do
        it 'calls super with chef_node_name and bootstrap_template' do
          bs.name_args = ['host0001']
          bs.config[:bootstrap_template] = 'bar'
          bs.config[:winrm_password] = 'baz'
          # PrivateKeyMissing by calling super, without chef-server credential
          expect {
            bs.run
          }.to raise_error(Chef::Exceptions::PrivateKeyMissing)
        end
      end

      context 'with FQDN' do
        it 'calls super with chef_node_name and bootstrap_template' do
          bs.name_args = ['host0001.example.com']
          bs.config[:bootstrap_template] = 'bar'
          bs.config[:winrm_password] = 'baz'
          # PrivateKeyMissing by calling super, without chef-server credential
          expect {
            bs.run
          }.to raise_error(Chef::Exceptions::PrivateKeyMissing)
        end
      end
    end
  end

  describe '#deps' do
    it 'does not raise' do
      expect {
        ElasticInfra::DirectorBootstrapWindows.load_deps
      }.not_to raise_error
    end
  end
end
