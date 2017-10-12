class CreateVotes < ActiveRecord::Migration[5.1]
    def change
      create_table :votes do |t|
    t.boolean :vote
    t.integer :user_id, foreign_key: true, null: false
    t.integer :suggestion_id, foreign_key: true

    t.timestamps
  end
  end
end
