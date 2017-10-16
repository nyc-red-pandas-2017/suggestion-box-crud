class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :vote
      t.string :votable_type
      t.integer :votable_id
      t.integer :user_id, { null: false }
      t.timestamps
    end
    add_index :votes, [:votable_type, :votable_id]
  end
end

# class CreateVotes < ActiveRecord::Migration[5.1]
#   def change
#   	create_table :votes do |t|
#       t.integer :vote, :null => false, default: 0
#   		t.references :user
#   		t.references :suggestion
#   		t.timestamps
#   	end
#   end
# end
