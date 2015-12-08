class ChangeCategoryAndFrequencyToInteger < ActiveRecord::Migration
  	def change
  		remove_column :goals, :category
      	add_column :goals, :category, :integer, default: 0
      	remove_column :goals, :frequency
      	add_column :goals, :frequency, :integer, default: 0
  	end
end
