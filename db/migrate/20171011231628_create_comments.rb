class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :suggestion_id, foreign_key: true
      t.integer :user_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
