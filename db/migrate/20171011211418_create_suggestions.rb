class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :title , null: false
      t.string :description, null:
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

#can also be writen as t.string (:title,:description , null: false)
