class SubmittedAnswer < ActiveRecord::Base
  belongs_to :test_run
  belongs_to :question

  validates :question_number, uniqueness:{scope: :test_run_id}


  attr :answer_ids
end
