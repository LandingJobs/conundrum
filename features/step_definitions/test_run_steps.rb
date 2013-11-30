Given(/^I'm in the skill test's frontpage$/) do
  visit skill_test_path(@skill_test)
end

Given(/^I press the start skill test button$/) do
  page.find('#start-test').click
end

Then(/^I should have started the skill test$/) do
  expect(TestRun.count).to eq 1
end

Then(/^I should see the first question$/) do
  expect(page).to have_css('#question')
  within('#question') { expect(page).to have_content(@skill_test.questions.first.question_text) }
end

Then(/^I should see the possible answers to that question$/) do
  expect(page).to have_css('#answers')
  answers = @skill_test.questions.first.answers
  within('#answers') do
    answers.each { |answer| expect(page).to have_content(answer) }
  end
end

###

Given(/^I have started a skill test with (\d+) questions$/) do |num_questions|
  @skill_test = Fabricate(:skill_test) do
    questions(count: num_questions.to_i)
  end

  @skill_test.questions.each { |q| q.answers.first.update_attributes(is_correct:true)}

  visit skill_test_path(@skill_test)
  page.find('#start-test').click
  Timecop.freeze(Time.now)

end

When(/^I take (\d+) seconds to complete the skill test with 1 correct answer$/) do |time|
  correct_answer = @skill_test.questions.first.answers.first.answer_text
  incorrect_answer = @skill_test.questions.last.answers.last.answer_text

  check(correct_answer)
  click_button('Next')

  check(incorrect_answer)
  Timecop.travel(Time.now + time.to_i)
  click_button('Next')
end

Then(/^my score should be (\d+\.\d+)%$/) do |score|
  expect(page).to have_content(score)
end

Then(/^my time should be (\d+:\d+)$/) do |time|
  expect(page).to have_content(time)
end

###

When(/^I take (\d+) seconds to answer the first question$/) do |time|
  answer = @skill_test.questions.first.answers.first.answer_text

  Timecop.travel(Time.now + time.to_i)

  check(answer)
  click_button('Next')
end

Then(/^I should see I used (\d+) seconds$/) do |time|
  expect(page).to have_content(time)
end