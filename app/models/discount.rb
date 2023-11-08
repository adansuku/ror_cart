class Discount < ApplicationRecord
  has_many :products

  validates :name, :discount_type, :value, :minimum_quantity, presence: true

  def calculate_discounted_price(price, quantity)
    return price * quantity unless meets_minimum_quantity?(quantity)

    apply_price(price, quantity)
  end

  private

  def apply_price(price, quantity)
    case discount_type
    when 'BOGO'
      (quantity / 2 + quantity % 2) * price
    when 'BULK'
      quantity * value
    when 'PERCENTAGE'
      quantity * price * (1 - (1.0 / 3.0))
    else
      quantity * price
    end
  end

  # Check if the minimum quantity for the discount is met
  def meets_minimum_quantity?(quantity)
    quantity >= minimum_quantity
  end
end
