# app/controllers/carts_controller.rb
class CartsController < ApplicationController
  before_action :authenticate_user!

  def add_to_cart
    product = Product.find(params[:product_id])
    current_cart.add_product(product)

    redirect_to root_path, notice: 'Product added to cart!'
  end

  def empty_cart
    current_user.carts.destroy_all
  end
end
