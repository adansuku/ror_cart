# app/models/cart_item.rb
class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  delegate :discount, to: :product, allow_nil: true
  before_save :apply_and_save_discount

  def apply_and_save_discount
    if discount
      apply_discount
    else
      self.total_price = product.price * quantity
    end
  end

  private

  def apply_discount
    self.total_price = calculate_discounted_price
    self.discount_amount = original_price - total_price
  end

  def original_price
    product.price * quantity
  end

  def calculate_discounted_price
    discount.calculate_discounted_price(product.price, quantity)
  end
end
