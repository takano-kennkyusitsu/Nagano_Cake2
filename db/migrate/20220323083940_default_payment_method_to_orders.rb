class DefaultPaymentMethodToOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :payment_method, :integer, default: 0

  end
end
