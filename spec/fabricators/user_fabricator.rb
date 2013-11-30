Fabricator(:user) do
  name { Faker::Name.name }
  email { Faker::Internet.email }
  authentications(count:1)
end
