class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.string :breed, null: false
      t.integer :age, null: false
      t.string :size, null: false
      t.text :description, null: false
      t.string :availability, null: false
      t.string :suburb, null: false
      t.string :postal_code, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :dogs, :name, unique: true
  end
end
