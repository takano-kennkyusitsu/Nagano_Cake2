class ChangeDatatypeGenreIdOfPruducts < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :genre_id, :integer
  end
end
