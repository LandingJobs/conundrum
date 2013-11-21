Fabricator(:skill_test) do
  title {  sequence(:testname) { |i| "Awesome Skill Test #{i}" } }
  instructions { Faker::Lorem.paragraph }
  questions(count: 5)
end

Fabricator(:single_question_skill_test, from: :skill_test) do
  questions(count:1)
end