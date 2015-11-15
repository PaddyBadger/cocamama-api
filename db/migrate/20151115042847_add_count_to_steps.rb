class AddCountToSteps < ActiveRecord::Migration
  	def change
  		change_table :steps do |t|
      		t.integer :count, default: 0
    	end
  	end
end
