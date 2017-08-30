# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Knife::Director do
  it 'has a version number' do
    expect(Knife::Director::VERSION).not_to be nil
  end
end
