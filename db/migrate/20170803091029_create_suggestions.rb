class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.column :title, :string, null: false
      t.column :description, :string, null: false
      t.references :user
      t.timestamps
    end
  end
end
