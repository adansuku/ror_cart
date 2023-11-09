# app/controllers/carts_controller.rb
class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart_items = current_cart.cart_items
  end

  def add_to_cart
    product = Product.find(params[:product_id])
    current_cart.add_product(product)

    redirect_to root_path, notice: 'Product added to cart!'
  end

  def empty_cart
    current_user.cart.destroy
  end
end
