ActiveAdmin.register Answer do
  belongs_to :question

  permit_params :answer_text, :is_correct, :question_id
end
