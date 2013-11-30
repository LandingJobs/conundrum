Fabricator(:test_run) do
  skill_test
  user
end

Fabricator(:finished_test_run, from: :test_run) do
  finished_at { Time.now }
  score 50.0
end