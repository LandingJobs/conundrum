When(/^I navigate to the skill test's frontpage$/) do
  visit skill_test_path(@skill_test)
end

Then(/^I should see the skill test's title$/) do
  expect(page).to have_css('#test-title')
  within('#test-title') { expect(page).to have_content(@skill_test.title) }
end

Then(/^I should see the the skill test's instructions$/) do
  expect(page).to have_css('#instructions')
  within('#instructions') { expect(page).to have_content(@skill_test.instructions) }
end

Then(/^I should see the start skill test button$/) do
  expect(page).to have_css('#start-test')
end

Then(/^I should see the number of questions the skill test has$/) do
  within('#summary') { expect(page).to have_content(@skill_test.questions.count) }
end