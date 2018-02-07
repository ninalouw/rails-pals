class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :screen_name, null: false
      t.text :description, null: false
      t.string :occupation, null: false
      t.string :suburb, null: false
      t.string :postal_code, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :profiles, :screen_name, unique: true
  end
end
