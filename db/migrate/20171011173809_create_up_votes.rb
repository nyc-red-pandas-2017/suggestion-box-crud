class CreateUpVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :up_votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :suggestion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
