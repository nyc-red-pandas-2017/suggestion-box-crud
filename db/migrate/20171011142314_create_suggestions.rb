class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :title, null: false
      t.string :details, null: false

      t.timestamps
    end
  end
end
