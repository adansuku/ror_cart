class Product < ApplicationRecord
  belongs_to :discount, optional: true

  validates_uniqueness_of :product_code, on: :create, message: 'must be unique'
  validates :name, :price, presence: true
end
