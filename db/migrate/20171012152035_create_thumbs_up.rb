class CreateThumbsUp < ActiveRecord::Migration[5.1]
  def change
    create_table :thumb_up do |t|
      t.integer :value
      t.belongs_to :suggestion , :user
    end
  end
end
