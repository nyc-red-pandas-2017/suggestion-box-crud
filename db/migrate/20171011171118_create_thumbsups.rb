class CreateThumbsups < ActiveRecord::Migration[5.1]
  def change
    create_table :thumbsup do |t|
      t.integer :vote
      t.references :user, foreign_key: true
      t.references :suggestions, foreign_key: true
      t.timestamps(null: false)
    end
  end
end
