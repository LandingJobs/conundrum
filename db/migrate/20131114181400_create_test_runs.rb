class CreateTestRuns < ActiveRecord::Migration
  def change
    create_table :test_runs do |t|

      t.float :score
      t.timestamp :finished_at
      t.references :skill_test, index: true

      t.timestamps
    end
  end
end
