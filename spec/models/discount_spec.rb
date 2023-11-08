require 'rails_helper'

RSpec.describe Discount, type: :model do
  let(:buy_one_get_one_free) do
    create(:discount,
           discount_type: 'BOGO',
           minimum_quantity: 2)
  end
  let(:bulk_strawberries) do
    create(:discount,
           discount_type: 'BULK',
           value: 4.50,
           minimum_quantity: 3)
  end
  let(:bulk_coffee) do
    create(:discount,
           discount_type: 'PERCENTAGE',
           value: 0.33,
           minimum_quantity: 3)
  end

  let(:green_tea) do
    create(:product,
           product_code: 'GR1',
           name: 'Green Tea',
           price: 3.11,
           discount: buy_one_get_one_free)
  end
  let(:strawberries) do
    create(:product,
           product_code: 'SR1',
           name: 'Strawberries',
           price: 5.00,
           discount: bulk_strawberries)
  end
  let(:coffee) do
    create(:product,
           product_code: 'CF1',
           name: 'Coffee',
           price: 11.23,
           discount: bulk_coffee)
  end

  it 'is valid with valid attributes' do
    expect(buy_one_get_one_free).to be_valid
    expect(bulk_strawberries).to be_valid
    expect(bulk_coffee).to be_valid
  end

  it 'calculates discounted price correctly for buy one get one free' do
    expect(buy_one_get_one_free.calculate_discounted_price(green_tea.price, 2)).to eq(green_tea.price)
  end

  it 'calculates discounted price correctly for bulk strawberries' do
    expect(bulk_strawberries.calculate_discounted_price(strawberries.price, 3)).to eq(4.50 * 3)
  end

  it 'calculates discounted price correctly for bulk coffee' do
    expect(bulk_coffee.calculate_discounted_price(coffee.price,
                                                  3).round(2)).to eq((coffee.price * (1 - (1.0 / 3.0)) * 3).round(2))
  end
end
