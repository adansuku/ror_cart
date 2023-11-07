# db/seeds.rb

# Limpiar datos existentes
CartItem.delete_all
Cart.delete_all
Discount.delete_all
Product.delete_all
User.delete_all

# Crear descuentos
bogo_discount = Discount.create!(
  name: 'Buy One Get One Free',
  discount_type: 'BOGO',
  value: 1.0,
  minimum_quantity: 2
)

bulk_discount_strawberries = Discount.create!(
  name: 'Bulk discount',
  discount_type: 'BULK',
  value: 4.50,
  minimum_quantity: 3
)

percentage_discount_coffee = Discount.create!(
  name: 'Percentage discount',
  discount_type: 'PERCENTAGE',
  value: 0.3333,
  minimum_quantity: 3
)

# Create products and discounts
green_tea = Product.create!(product_code: 'GR1', name: 'Green Tea', price: 3.11, discount: bogo_discount)
strawberries = Product.create!(product_code: 'SR1', name: 'Strawberries', price: 5.00,
                               discount: bulk_discount_strawberries)
coffee = Product.create!(product_code: 'CF1', name: 'Coffee', price: 11.23, discount: percentage_discount_coffee)

# Create an user
user = User.create!(
  email: 'adangrx@gmail.com',
  password: 'password123',
  password_confirmation: 'password123'
)

# Create cart and add products
cart = Cart.create!(user: user)
cart.add_product(green_tea, 2)
cart.add_product(strawberries, 3)
cart.add_product(coffee, 1)

puts 'Products, Discounts, Cart Items, and User have been seeded.'
