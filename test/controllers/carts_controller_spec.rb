require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:user) { create(:user) }
  let(:product) { create(:product) }

  before do
    sign_in user
  end

  describe 'POST #add_to_cart' do
    it 'adds a product to the cart' do
      expect do
        post :add_to_cart, params: { product_id: product.id }
      end.to change(user.carts, :count).by(1)

      expect(response).to redirect_to(products_show_path)
      expect(flash[:notice]).to eq('Product added to cart!')
    end

    it 'handles non-existent products' do
      expect do
        post :add_to_cart, params: { product_id: -1 }
      end.not_to change(user.carts, :count)

      expect(response).to redirect_to(products_show_path)
      expect(flash[:alert]).to eq('Product not found')
    end
  end

  describe 'POST #empty_cart' do
    before do
      user.carts.create(product: product)
    end

    it 'empties the cart' do
      expect do
        post :empty_cart
      end.to change(user.carts, :count).by(-1)
    end
  end
end
