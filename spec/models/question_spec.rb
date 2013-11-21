require 'spec_helper'

describe Question do
  it 'has a valid factory' do
    expect(Fabricate(:question)).to be_valid
  end

  it 'is invalid without a question text' do
    expect(Fabricate.build(:question, question_text:nil)).not_to be_valid
  end
end
