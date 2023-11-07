class CreateCartItems < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.integer :quantity
      t.float :total_price
      t.references :product
      t.decimal :discount, precision: 10, scale: 2
      t.decimal :subtotal, precision: 10, scale: 2

      t.timestamps
    end
  end
end
