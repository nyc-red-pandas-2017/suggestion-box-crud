class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.column :title, :string, null: false
      t.column :description, :string, null: false
      t.column :user_id, :string, null: false

      t.timestamps
    end
  end
end
