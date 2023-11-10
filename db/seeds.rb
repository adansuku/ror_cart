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
  value: 2,
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
  value: 0.333334,
  minimum_quantity: 3
)

# Create products and discounts
green_tea_image = 'https://static-bebeautiful-in.unileverservices.com/green-tea-youthful-skin-secret_1.jpg'
strawberries_image = 'https://cdn11.bigcommerce.com/s-i7i23daso6/images/stencil/640w/products/10739/15772/Strawberry_Florence_Late_0005016__40227.1623343614.jpg'
coffe_image = 'https://www.tastingtable.com/img/gallery/coffee-brands-ranked-from-worst-to-best/intro-1645231221.jpg'

green_tea = Product.create!(
  product_code: 'GR1',
  name: 'Green Tea',
  price: 3.11,
  discount: bogo_discount,
  image: green_tea_image
)

strawberries = Product.create!(
  product_code: 'SR1',
  name: 'Strawberries', price: 5.00,
  discount: bulk_discount_strawberries,
  image: strawberries_image
)

coffee = Product.create!(
  product_code: 'CF1', name: 'Coffee',
  price: 11.23,
  discount: percentage_discount_coffee,
  image: coffe_image
)

# Create an user
user = User.create!(
  email: 'adangrx@gmail.com',
  password: 'password123',
  password_confirmation: 'password123'
)

puts 'Products, Discounts, Cart Items, and User have been seeded.'
