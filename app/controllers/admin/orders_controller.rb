class Admin::OrdersController < ApplicationController
  def show
    def show
    @order = Order.find(params[:id])
    @order.postage  = 800
    @order_details = @order.order_details
    
    @total = 0
    @order_details.each do |order_detail|
    @total += order_detail.sub_total
    end
    
    @total_price = 0 
    @total_price = @order.postage + @total
    end

  end
  
  

  def update
    
    
  end
end
