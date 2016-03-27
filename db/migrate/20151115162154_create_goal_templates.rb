class CreateGoalTemplates < ActiveRecord::Migration
  def change
    create_table :goal_templates do |t|
      t.string :title, default: ""
      t.string :description, default: ""
      t.integer :category, default: 0
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
