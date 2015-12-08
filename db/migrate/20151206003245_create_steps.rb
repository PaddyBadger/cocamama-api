class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.datetime :day
      t.boolean :completed
      t.integer :participation_tracker_id

      t.timestamps null: false
    end
    add_index :steps, :participation_tracker_id
  end
end