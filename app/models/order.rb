class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  
  enum payment_method: { credit_card: 0, transfe: 1}
  enum status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}
  
  
  def sub_total
        order_detail.intax_price * order_detail.amount
  
  end
end
