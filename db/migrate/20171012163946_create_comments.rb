class CreateComments < ActiveRecord::Migration[5.1]
  def change
     create_table :comments do |t|
      t.string :body, null: false
      t.references :user, foreign_key: true
      t.references :suggestion, foreign_key: true
      t.integer :thumbs_up, default: 0

      t.timestamps(null: false)
    end
  end
end
