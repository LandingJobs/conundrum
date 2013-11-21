require 'spec_helper'

describe Answer do
  it 'has a valid factory' do
    expect(Fabricate(:answer)).to be_valid
  end

  it 'is invalid without an answer text' do
    expect(Fabricate.build(:answer, answer_text:nil)).not_to be_valid
  end

  it 'is invalid without is_correct set' do
    expect(Fabricate.build(:answer, is_correct:nil)).not_to be_valid
  end
end
