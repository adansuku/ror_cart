class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :name
      t.string :discount_type
      t.float :value
      t.integer :minimum_quantity

      t.timestamps
    end
  end
end
