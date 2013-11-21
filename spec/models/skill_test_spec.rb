require 'spec_helper'

describe SkillTest do
  it 'has a valid factory' do
    expect(Fabricate(:skill_test)).to be_valid
  end

  it 'is invalid without a title' do
    expect(Fabricate.build(:skill_test, title:nil)).not_to be_valid
  end

  it 'is invalid without instructions' do
    expect(Fabricate.build(:skill_test, instructions:nil)).not_to be_valid
  end
end
