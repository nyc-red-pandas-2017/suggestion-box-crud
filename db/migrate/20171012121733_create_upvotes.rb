class CreateUpvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :upvotes do |t|
      t.integer :value
      t.belongs_to :suggestion
      t.timestamps
    end
  end
end
