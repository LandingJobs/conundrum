class MailPreview < MailView

    def internal_results
      test_run = TestRun.last
      InternalResultsMailer.send_results(test_run)
    end

    def user
      test_run = TestRun.last
      UserResultsMailer.send_results(test_run)
    end
  end