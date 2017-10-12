class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :title , null: false
      t.string :description, null: false
      t.references :user

      t.timestamps
    end
  end
end
