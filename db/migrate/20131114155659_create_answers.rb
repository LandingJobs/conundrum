class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|

      t.string :answer_text,  null:false
      t.boolean :is_correct,  null:false, default:false
      t.references :question, index: true

      t.timestamps
    end
  end
end
