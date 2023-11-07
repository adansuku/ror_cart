class Discount < ApplicationRecord
  has_many :products

  def calculate_discounted_price(price, quantity)
    return price * quantity unless meets_minimum_quantity?(quantity)

    case discount_type
    when 'BUY_ONE_GET_ONE'
      (quantity / 2 + quantity % 2) * price
    when 'BULK'
      quantity * value
    when 'PERCENTAGE'
      quantity * price * (1 - value)
    else
      quantity * price
    end
  end

  private

  # Verifica si se cumple la cantidad mínima para el descuento
  def meets_minimum_quantity?(quantity)
    quantity >= minimum_quantity
  end
end
