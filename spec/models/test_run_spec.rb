require 'spec_helper'

describe TestRun do
  it 'has a valid factory' do
    expect(Fabricate(:test_run)).to be_valid
  end
end
