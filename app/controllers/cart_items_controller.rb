# app/controllers/cart_items_controller.rb
class CartItemsController < ApplicationController
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.destroy if params[:quantity] == 0
    if cart_item.update(quantity: cart_item_params)
      redirect_to root_path, notice: 'Cart item updated.'
    else
      redirect_to root_path, alert: 'Could not update cart item.'
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to root_path
  end

  private

  def cart_item_params
    params.require(:quantity)
  end
end
