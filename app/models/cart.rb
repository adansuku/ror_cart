class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :user

  def add_product(product, quantity = 1)
    item = cart_items.find_or_initialize_by(product: product)
    item.quantity = (item.quantity || 0) + quantity
    item.save
  end

  def total_price
    cart_items.sum(&:discounted_price)
  end
end
