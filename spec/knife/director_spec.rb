require "spec_helper"

RSpec.describe Knife::Director do
  it "has a version number" do
    expect(Knife::Director::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
