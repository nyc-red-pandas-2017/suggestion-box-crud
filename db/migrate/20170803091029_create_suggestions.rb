class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.column :title, :string
      t.column :description, :string

      t.timestamps
    end
  end
end
