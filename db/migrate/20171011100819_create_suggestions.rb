class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :title, default: "Untitled"
      t.string :description
      t.references :user, foreign_key: true
      t.integer :thumbs_up, default: 0

      t.timestamps(null: false)
    end
  end
end
