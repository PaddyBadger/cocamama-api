class AddIconToGoalTemplate < ActiveRecord::Migration
  def change
  		change_table :goal_templates do |t|
  			t.string :icon
		end
  end
end
