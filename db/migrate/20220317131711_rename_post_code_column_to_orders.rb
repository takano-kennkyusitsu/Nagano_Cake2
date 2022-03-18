class RenamePostCodeColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :post_code, :postcode
  end
end
