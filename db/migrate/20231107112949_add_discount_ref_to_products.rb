class AddDiscountRefToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :discount, foreign_key: true
  end
end
