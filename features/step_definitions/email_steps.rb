Given(/^a user has completed a skill test$/) do
  @skill_test = Fabricate(:skill_test) do
    questions(count: 2)
  end

  @skill_test.questions.each { |q| q.answers.first.update_attributes(is_correct:true)}

  visit skill_test_path(@skill_test)
  page.find('#start-test').click
  Timecop.freeze(Time.now)

  answer1 = @skill_test.questions.first.answers.first.answer_text
  answer2 = @skill_test.questions.last.answers.last.answer_text

  check(answer1)
  click_button('Next')

  check(answer2)
  Timecop.travel(Time.now + 60)
  click_button('Next')
end

Then(/^I should receive an email with the user's skill test results$/) do
  email = ActionMailer::Base.deliveries.first

  expect(email.from).to include(ENV['CONUNDRUM_MAIL_FROM'])
  expect(email.to).to include(ENV['CONUNDRUM_MAIL_FROM'])
  expect(email.body).to include(@skill_test.title)
  expect(email.body).to include(TestRun.last.score.to_s)

end