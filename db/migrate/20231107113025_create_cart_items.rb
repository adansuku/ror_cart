class CreateCartItems < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.integer :quantity
      t.float :total_price
      t.references :product
      # t.float :discount
      # t.float :subtotal

      t.timestamps
    end
  end
end
