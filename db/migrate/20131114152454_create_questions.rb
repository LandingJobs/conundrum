class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|

      t.text :question_text, null:false
      t.references :skill_test,   index: true

      t.timestamps
    end
  end
end
