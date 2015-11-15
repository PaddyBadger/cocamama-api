class ChangeCategoryAndFrequencyToInteger < ActiveRecord::Migration
  	def change
  		remove_column :steps, :category
      	add_column :steps, :category, :integer, default: 0
      	remove_column :steps, :frequency
      	add_column :steps, :frequency, :integer, default: 0
  	end
end
