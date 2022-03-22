class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  
   def sub_total
        tax_in_price * quantity
   end
end
