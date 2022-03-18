class AddColumnOrders < ActiveRecord::Migration[6.1]
  def up
    add_column :shippings, :customer_id, :integer
  end
end
