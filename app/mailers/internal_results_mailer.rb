class InternalResultsMailer < ActionMailer::Base
  default from: ENV['CONUNDRUM_MAIL_FROM']

  def send_results(test_run)
    @test_run = test_run
    @time_taken = TimeDifference.between(@test_run.created_at, @test_run.finished_at).in_general

    mail to: ENV['CONUNDRUM_MAIL_FROM'],
         subject: 'Test run results',
         template_name: 'send_results.txt'


  end
end
