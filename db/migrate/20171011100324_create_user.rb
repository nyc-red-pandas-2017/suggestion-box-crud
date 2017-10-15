class CreateUser < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.column :name, :string, unique: true, null: false
      t.column :password_digest, :string, null: false

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
