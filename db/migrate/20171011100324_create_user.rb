class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.column :name, :string
    end
  end
end
