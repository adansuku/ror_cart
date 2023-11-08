class AddImageToProducts < ActiveRecord::Migration[7.1]
  def up
    add_column :products, :image, :string
  end

  def down
    remove_column :products, :image
  end
end
