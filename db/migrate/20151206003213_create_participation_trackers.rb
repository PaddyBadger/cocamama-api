class CreateParticipationTrackers < ActiveRecord::Migration
  def change
    create_table :participation_trackers do |t|
      t.integer :user_id
      t.integer :goal_id

      t.timestamps null: false
    end
    add_index :participation_trackers, :goal_id
  end
end
