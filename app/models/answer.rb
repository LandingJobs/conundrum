class Answer < ActiveRecord::Base

  belongs_to :question

  validates :answer_text, presence:true
  validates :is_correct, inclusion: {in: [true, false]}

  default_scope {  order('random()') }

  def to_s
    answer_text
  end
end
