Fabricator(:question) do
  question_text  { Faker::Lorem.paragraph }
  answers(count:2)
  after_build { |q| q.answers.first.update_attributes(is_correct:true) }
end
