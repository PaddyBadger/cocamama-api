class AddCategoriesAndDatesToGoal < ActiveRecord::Migration
  	def change
  		change_table :goals do |t|
      		t.datetime :start_at
      		t.datetime :end_at
      		t.string :category
      		t.string :frequency
    	end
  	end
end
