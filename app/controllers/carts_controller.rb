# app/controllers/carts_controller.rb
class CartsController < ApplicationController
  before_action :authenticate_user!

  def add_to_cart
    product = Product.find(params[:product_id])
    current_cart.add_product(product)

    # Redirigir al usuario con un mensaje
    redirect_to products_show_path, notice: 'Producto agregado al carrito!'
  end


end
