class AddIsDeletedToProduct < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :is_active, :boolean, :default => true
  end
end
