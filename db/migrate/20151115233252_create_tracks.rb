class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.datetime :day
      t.boolean :completed
      t.integer :participation_tracker_id

      t.timestamps null: false
    end
    add_index :tracks, :participation_tracker_id
  end
end
