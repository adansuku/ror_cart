class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  delegate :discount, to: :product, allow_nil: true
  before_save :apply_discount

  private

  def apply_discount
    self.total_price = if discount
                         discount.calculate_discounted_price(product.price, quantity)
                       else
                         product.price * quantity
                       end
  end
