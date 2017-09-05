require "spec_helper"
require 'dependencyswapper'

RSpec.describe Dependencyswapper do
  it "has a version number" do
    expect(Dependencyswapper::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
