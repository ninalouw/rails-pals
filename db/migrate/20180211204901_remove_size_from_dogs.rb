class RemoveSizeFromDogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :dogs, :size, :string
  end
end
