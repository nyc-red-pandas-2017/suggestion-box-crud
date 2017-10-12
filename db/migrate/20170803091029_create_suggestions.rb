class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.column :title, :string
      t.column :description, :string
      t.integer :user_id
      t.timestamps
    end
  end
end
