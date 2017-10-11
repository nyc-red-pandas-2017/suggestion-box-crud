class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :title, null: false, limit: 40
      t.string :body, null: false

      t.timestamps
    end
  end
end
