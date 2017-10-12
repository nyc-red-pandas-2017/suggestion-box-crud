class CreateThumbsUp < ActiveRecord::Migration[5.1]
  def change
    create_table :thumb_up do |t|
      t.integer :value
      t.integer :suggestion_id
      t.integer :voter_id
    end
  end
end
