class DiscountCalculatorService
  def initialize(discount)
    @discount = discount
    @value = discount.value
  end

  attr_reader :value

  def apply_price(price, quantity)
    case @discount.discount_type
    when 'BOGO'
      ((quantity / value.to_i) + (quantity % value.to_i)) * price
    when 'BULK'
      quantity * value
    when 'PERCENTAGE'
      result = quantity * price * (1 - value)
      result.round(2)
    else
      quantity * price
    end
  end
end
