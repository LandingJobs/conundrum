class TestRun < ActiveRecord::Base

  belongs_to :skill_test
  has_many :submitted_answers

  belongs_to :user
end
