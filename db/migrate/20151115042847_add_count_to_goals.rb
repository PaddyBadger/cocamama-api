class AddCountToGoals < ActiveRecord::Migration
  	def change
  		change_table :goals do |t|
      		t.integer :count, default: 0
    	end
  	end
end
