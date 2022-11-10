class AddImgToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :img, :string
  end
end