class CreateVotes < ActiveRecord::Migration[5.1]
  def change
  	create_table :votes do |t|
  		t.references :user
  		t.references :suggestion
  		t.timestamps
  	end
  end
end
