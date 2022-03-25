class Admin::OrdersController < ApplicationController
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




  def update
   @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details
    if @order.status == "入金確認"
      @order_details.each do |order_detail|
        order_detail.update(making_status: 1)
      end
    end
    redirect_to(admin_order_path)
  end


  def order_params
    params.require(:order).permit(:status)

  end



  def update
   @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details
    if @order.status == "入金確認"
      @order_details.each do |order_detail|
        order_detail.update(making_status: 1)
      end
    end
    redirect_to(admin_order_path)
  end


  def order_params
    params.require(:order).permit(:status)

  end
end