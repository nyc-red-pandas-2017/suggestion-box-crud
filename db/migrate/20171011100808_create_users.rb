class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstname, null: false, default: "Anonymous"
      t.string :lastname, null: false, default: "Anonymous"
      t.string :username, null: false, unique: true, default: "Anonymous"
      t.string :email, null: false
      t.string :password_hash, null: false

      t.timestamps(null: false)
    end
  end
end
