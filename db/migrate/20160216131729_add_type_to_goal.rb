class AddTypeToGoal < ActiveRecord::Migration
  	def change
		change_table :goals do |t|
  			t.string :type
		end
  	end
end
