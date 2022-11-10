class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :price
      t.string :owner
      t.string :location
    end
  end
end
