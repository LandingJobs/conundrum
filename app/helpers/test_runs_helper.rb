module TestRunsHelper

  def total_test_time test_run
    time = TimeDifference.between(test_run.created_at, test_run.finished_at).in_general

    "#{'%02i' % time[:minutes]}:#{'%02i' % time[:seconds]}"
  end

end
