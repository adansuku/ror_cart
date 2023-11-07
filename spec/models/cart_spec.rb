require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'validations' do
    let(:user) { create(:user) }
    let(:cart) { create(:cart, user: user) }
    let(:product) { create(:product) }

    it 'is valid with valid attributes' do
      expect(cart).to be_valid
    end

    it 'belongs to user' do
      expect(cart.user).to eq(user)
    end

    it 'can add a product' do
      expect do
        cart.add_product(product)
      end.to change { cart.cart_items.count }.by(1)
    end

    it 'increases the quantity of a product if it is already in the cart' do
      cart.add_product(product)
      expect do
        cart.add_product(product)
      end.to change { cart.cart_items.find_by(product: product).quantity }.by(1)
    end

    it 'calculates total price correctly' do
      cart.add_product(product, 2)
      expect(cart.total_price).to eq(product.price * 2)
    end
  end
end
