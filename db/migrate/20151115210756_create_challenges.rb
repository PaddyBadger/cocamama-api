class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :winner_id
      t.integer :step_id

      t.timestamps null: false
    end
    add_index :challenges, :step_id
  end
end
