class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :title, { default: "Untitled" }
      t.string :description
      t.integer :user_id

      t.timestamps(null: false)
    end
  end
end
