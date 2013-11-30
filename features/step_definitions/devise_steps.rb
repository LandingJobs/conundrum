include Warden::Test::Helpers

Given(/^I am logged in as that user$/) do
  login_as @user
end
