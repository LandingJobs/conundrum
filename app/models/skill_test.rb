class SkillTest < ActiveRecord::Base

  has_many :questions
  has_many :test_runs

  validates :title, presence:true
  validates :instructions, presence:true

end
