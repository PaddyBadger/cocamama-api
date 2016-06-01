class AddUserIndexToParticipationTrackers < ActiveRecord::Migration
  def change
  	change_table :participation_trackers do
  		add_index :participation_trackers, :user_id
  	end
  	
  end
end
