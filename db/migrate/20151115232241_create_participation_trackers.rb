class CreateParticipationTrackers < ActiveRecord::Migration
  def change
    create_table :participation_trackers do |t|
      t.integer :user_id
      t.integer :challenge_id

      t.timestamps null: false
    end
    add_index :participation_trackers, :challenge_id
  end
end
