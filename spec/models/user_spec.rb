require 'spec_helper'

describe User do
  it 'has a valid factory' do
    expect(Fabricate(:user)).to be_valid
  end
end
