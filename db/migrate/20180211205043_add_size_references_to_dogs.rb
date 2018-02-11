class AddSizeReferencesToDogs < ActiveRecord::Migration[5.1]
  def change
     add_reference :dogs, :size, foreign_key: true
  end
end
