class Product < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre

 
  def get_product_image
    product_image.attached? ? product_image : 'no_image.jpg'
  end
  
end