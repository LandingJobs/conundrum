Fabricator(:authentication) do
  username { Faker::Internet.user_name }
  provider :github
end
