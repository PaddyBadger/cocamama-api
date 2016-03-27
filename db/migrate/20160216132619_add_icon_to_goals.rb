class AddIconToGoals < ActiveRecord::Migration
  def change
  		change_table :goals do |t|
  			t.string :icon
		end
  end
end
