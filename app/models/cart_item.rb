class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  def subtotal
    product.in_tax_price * quantity
  end
end
