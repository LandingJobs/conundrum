class CreateSkillTests < ActiveRecord::Migration
  def change
    create_table :skill_tests do |t|

      t.string :title,       null:false
      t.text :instructions,  null:false
      t.integer :time_limit, null:false, default:15

      t.timestamps
    end
  end
end
