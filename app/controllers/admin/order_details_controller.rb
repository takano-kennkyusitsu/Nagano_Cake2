class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail =OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    @order_details = @order.order_details.all
    
    if @order_details.where(making_status: "製作中").any?
      @order.status = "製作中"
      @order.save
    elsif @order_details.count ==  @order_details.where(making_status: "製作完了").count
       @order.status = "発送準備中"
      @order.save
    else 
      
    end
    redirect_to admin_order_path(@order.id)
  end
  
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
