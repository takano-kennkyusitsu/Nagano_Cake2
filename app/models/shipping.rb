class Shipping < ApplicationRecord
  belongs_to :customer
  
 def full_address
   return "〒#{self.postcode} #{self.address} #{self.name}"
 end
 
end
