class CreateStepTemplates < ActiveRecord::Migration
  def change
    create_table :step_templates do |t|
      t.string :title, default: ""
      t.string :description, default: ""
      t.integer :category, default: 0

      t.timestamps null: false
    end
  end
end
