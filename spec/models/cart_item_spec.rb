require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:cart) { create(:cart) }
  let(:product) { create(:product) }
  let(:discounted_product) { create(:product, discount: create(:discount, minimum_quantity: 2)) }
  let(:cart_item) { create(:cart_item, cart: cart, product: product, quantity: 2) }
  let(:discounted_cart_item) { create(:cart_item, cart: cart, product: discounted_product, quantity: 2) }

  it 'is valid with valid attributes' do
    expect(cart_item).to be_valid
  end

  it 'belongs to cart' do
    expect(cart_item.cart).to eq(cart)
  end

  it 'belongs to product' do
    expect(cart_item.product).to eq(product)
  end

  it 'calculates total price correctly if no discount' do
    cart_item.save
    expect(cart_item.total_price).to eq(product.price * 2)
  end

  it 'calculates total price correctly if there is a discount' do
    discounted_cart_item.save
    expect(discounted_cart_item.total_price).to eq(discounted_product.discount.calculate_discounted_price(
                                                     discounted_product.price, 2
                                                   ))
  end
end
