Fabricator(:answer) do
  answer_text { Faker::Lorem.sentence }
  is_correct  false
end
