Fabricator(:test_run) do
  email     { Faker::Internet.email }
  skill_test
end

Fabricator(:finished_test_run, from: :test_run) do
  finished_at { Time.now }
  score 50.0
end