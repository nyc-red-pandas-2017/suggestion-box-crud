 class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, null:false, unique: true
      t.string :password_hash, null:false


      t.timestamps(null: false)
    end
  end
end
