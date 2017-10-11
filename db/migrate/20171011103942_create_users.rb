class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true, length: { minimum: 6}
      t.string :password_hash, { null: false, unique: true }

      t.timestamps
    end
  end
end