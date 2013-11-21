class TestRun < ActiveRecord::Base

  belongs_to :skill_test
  has_many :submitted_answers

  validates :email, :format => { :with => /\A[^@]+@[^@]+\z/i, allow_nil: true }
end
