class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :title, default: ""
      t.string :description, default: ""
      t.boolean :published, default: false
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :steps, :user_id
  end
end
