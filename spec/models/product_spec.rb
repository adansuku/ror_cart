require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { create(:product) }

  it 'is valid with valid attributes' do
    expect(product).to be_valid
  end

  it 'is not valid without a name' do
    product.name = nil
    expect(product).to_not be_valid
  end

  it 'is not valid without a price' do
    product.price = nil
    expect(product).to_not be_valid
  end

  it 'is not valid without a unique product_code' do
    duplicate_product = product.dup
    duplicate_product.product_code = product.product_code
    expect(duplicate_product).to_not be_valid
  end

  it 'belongs to discount' do
    discount = create(:discount, minimum_quantity: 2)
    product.discount = discount
    expect(product.discount).to eq(discount)
  end
end
