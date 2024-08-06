# app/models/cart_item.rb
class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  delegate :discount, to: :product, allow_nil: true
  before_save :save_price_with_discount_if_exists

  def save_price_with_discount_if_exists
    CartItemService.new(self).apply_and_save_discount
  end
end
