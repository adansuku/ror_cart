# En un archivo como test/factories.rb
FactoryBot.define do
  factory :product do
    name { 'Product Name' }
    price { 100 }
  end

  factory :discounted_product, parent: :product do
    after(:create) do |product|
      create(:discount, product: product, amount: 10)
    end
  end

  factory :user do
    email { 'test@example.com' }
    password { 'password' }
  end

  factory :cart do
    association :user
  end

  factory :cart_item do
    cart
    product
    quantity { 1 }
  end

  factory :discount do
    name { 'Discount Name' }
    discount_type { 'BULK' }
    value { 10 }
  end
end
