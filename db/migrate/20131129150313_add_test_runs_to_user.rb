class AddTestRunsToUser < ActiveRecord::Migration
  def change
    add_reference :test_runs, :user, index: true
  end
end
