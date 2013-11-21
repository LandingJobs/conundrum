class CreateSubmittedAnswers < ActiveRecord::Migration
  def change
    create_table :submitted_answers do |t|

      t.integer :question_number, null:false
      t.integer :score,           null:false
      t.integer :max_score,       null:false
      t.text :wrong_answers

      t.references :test_run,     index: true
      t.references :question,     index: true

      t.timestamps
    end
  end
end
