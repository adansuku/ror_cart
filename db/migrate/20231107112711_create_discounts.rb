class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :name
      t.string :discount_type
      t.decimal :value, precision: 10, scale: 2
      t.integer :minimum_quantity

      t.timestamps
    end
  end
end
