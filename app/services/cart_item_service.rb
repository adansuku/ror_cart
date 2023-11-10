# app/services/cart_item_service.rb
class CartItemService
  def initialize(cart_item)
    @cart_item = cart_item
    @product = cart_item.product
    @discount = cart_item.discount
    @quantity = cart_item.quantity
  end

  def apply_and_save_discount
    if @cart_item.discount
      apply_discount
    else
      cart_item.total_price = product.price * cart_item.quantity
    end
  end

  attr_reader :cart_item, :product, :discount, :quantity

  private

  def apply_discount
    cart_item.total_price = calculate_discounted_price
    cart_item.discount_amount = original_price - cart_item.total_price
  end

  def original_price
    product.price * cart_item.quantity
  end

  def calculate_discounted_price
    discount.calculate_discounted_price(product.price, cart_item.quantity)
  end
end
