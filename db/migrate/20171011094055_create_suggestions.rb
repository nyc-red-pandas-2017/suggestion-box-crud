class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :title, null:false
      t.string :description, null:false

      t.timestamps(null: false)
    end
  end
end
