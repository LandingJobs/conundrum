class Question < ActiveRecord::Base

  belongs_to :skill_test
  has_many :answers

  validates :question_text, presence: true

  default_scope {  order(:created_at) }

  def to_s
    question_text.truncate(50)
  end
end
