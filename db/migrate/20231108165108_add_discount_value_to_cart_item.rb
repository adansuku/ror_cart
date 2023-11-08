class AddDiscountValueToCartItem < ActiveRecord::Migration[7.1]
  def change
    add_column :cart_items, :discount_amount, :float
  end
end
