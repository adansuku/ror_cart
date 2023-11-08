class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
    @cart_items = current_cart.cart_items
    @number_of_cart_items = @cart_items.sum(&:quantity) || 0
  end
end
