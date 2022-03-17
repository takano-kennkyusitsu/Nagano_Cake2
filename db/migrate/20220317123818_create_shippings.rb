class CreateShippings < ActiveRecord::Migration[6.1]
  def change
    create_table :shippings do |t|
      t.string :address
      t.string :postcode
      t.string :name

      t.timestamps
    end
  end
end
