class CreateIcons < ActiveRecord::Migration
  	def change
    	create_table :icons do |t|
    		t.string :name, default: ""
    		t.string :keywords, default: ""
    		
      		t.timestamps null: false
    	end
  	end
end
