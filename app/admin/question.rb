ActiveAdmin.register Question do
  belongs_to :skill_test

  sidebar "Test Details", only: [:show, :edit] do
    ul do
      li link_to("Answers", admin_question_answers_path(question))
    end
  end

  permit_params :question_text, :skill_test_id
end
