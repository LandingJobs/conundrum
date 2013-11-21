require 'spec_helper'

describe TestRun do
  it 'has a valid factory' do
    expect(Fabricate(:test_run)).to be_valid
  end

  it 'is invalid with an invalid email' do
    expect(Fabricate.build(:test_run, email:'foo')).not_to be_valid
  end

  it 'is valid with a valid email' do
    expect(Fabricate.build(:test_run, email:'foo@example.com')).to be_valid
  end
end
