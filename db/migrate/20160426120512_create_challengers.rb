class CreateChallengers < ActiveRecord::Migration
  def change
    create_table :challengers do |t|
      t.string :name, default: ""
      t.string :email, null: false, default: ""
      t.boolean :challenge_accepted, defualt: false
      t.timestamps null: false
      t.integer :goal_id
    end
    add_index :challengers, :goal_id
  end
end
