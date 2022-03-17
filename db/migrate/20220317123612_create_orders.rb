class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :total_price
      t.integer :postage
      t.integer :payment_method
      t.string :adress
      t.string :post_code
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
