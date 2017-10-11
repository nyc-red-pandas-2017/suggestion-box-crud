class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :title, null: false, limit: 40
      t.string :body, null: false
      # Is putting the foreign_key validation reduent with t.reference
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
