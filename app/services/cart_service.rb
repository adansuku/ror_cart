class CartService
  def initialize(cart)
    @cart = cart
  end

  def add_product(product, quantity)
    item = @cart.cart_items.find_or_initialize_by(product: product)
    item.quantity = (item.quantity || 0) + quantity
    item.save
  end
end
