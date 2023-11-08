class ApplicationController < ActionController::Base
  before_action :initialize_cart

  private

  def initialize_cart
    return unless user_signed_in?

    cart = begin
      Cart.find(session[:cart_id])
    rescue StandardError
      nil
    end

    return unless cart.nil?

    cart = Cart.create(user: current_user)
    session[:cart_id] = cart.id
  end

  def current_cart
    return unless user_signed_in?

    @current_cart ||= Cart.find_by(id: session[:cart_id]) || Cart.create(user: current_user)
    session[:cart_id] = @current_cart.id unless session[:cart_id] == @current_cart.id
    @current_cart
  end
end
