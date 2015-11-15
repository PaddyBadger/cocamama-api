class AddCategoriesAndDatesToStep < ActiveRecord::Migration
  	def change
  		change_table :steps do |t|
      		t.datetime :start_at
      		t.datetime :end_at
      		t.string :category
      		t.string :frequency
    	end
  	end
end
