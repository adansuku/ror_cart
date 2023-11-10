class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :user

  validates :user_id, uniqueness: true

  def add_product(product, quantity = 1)
    CartService.new(self).add_product(product, quantity)
  end

  def total_price
    cart_items.sum(&:total_price)
  end
end
