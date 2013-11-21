class InternalResultsMailJob
  include SuckerPunch::Job

  def perform(test_run_id)
    ActiveRecord::Base.connection_pool.with_connection do
      test_run = TestRun.find(test_run_id)
      InternalResultsMailer.send_results(test_run).deliver
    end
  end
end