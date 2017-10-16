class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :title , null: false
      t.string :description, null: false
      t.integer :author_id
      t.integer :comment_count

      t.timestamps
    end
  end
end

#can also be writen as t.string (:title,:description , null: false)
