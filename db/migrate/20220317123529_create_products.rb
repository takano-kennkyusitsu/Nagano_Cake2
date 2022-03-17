class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :genre_id
      t.string :name
      t.text :about
      t.string :image
      t.integer :price
      t.boolean :is_active

      t.timestamps
    end
  end
end
