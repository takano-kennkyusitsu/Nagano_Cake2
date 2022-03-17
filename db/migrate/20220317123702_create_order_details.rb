class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :tax_in_price
      t.integer :making_status
      t.integer :quantity

      t.timestamps
    end
  end
end
