class Discount < ApplicationRecord
  has_many :products

  validates :name, :discount_type, :value, :minimum_quantity, presence: true

  def calculate_discounted_price(price, quantity)
    return price * quantity unless meets_minimum_quantity?(quantity)

    DiscountCalculatorService.new(self).apply_price(price, quantity)
  end

  private

  # Check if the minimum quantity for the discount is met
  def meets_minimum_quantity?(quantity)
    quantity >= minimum_quantity
  end
end
