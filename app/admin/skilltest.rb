ActiveAdmin.register SkillTest do


  sidebar "Test Details", only: [:show, :edit] do
    ul do
      li link_to("Questions", admin_skill_test_questions_path(skill_test))
    end
  end

  permit_params :title, :instructions, :time_limit
end
