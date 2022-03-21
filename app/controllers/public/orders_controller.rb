class Public::OrdersController < ApplicationController
  def new
   @order = Order.new
  end

 
  
  def create
  @cart_items = customer.cart_items.all
  @order = customer.orders.new(order_params)
  if @order.save
    cart_items.each do |cart|
      order_detail = OrderDetail.new
      order_detail.product_id = cart.product_id
      order_detail.order_id = @order.id
      order_detail.quantity = cart.quantity
      order_detail.intax_price = cart.product.in_tax_price
      order_detail.save
    end
    redirect_to orders_complete_path
    cart_items.destroy_all
  else
    render :new
  end
  end

  def show
    #@order=Order.find(params[:id])
    #@order.postage =800
  end

  def thank_you
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.postage = 800
    @total = @cart_items.inject(0) { |sum, item| sum + item.sub_total }
    @total_price = @order.postage + @total

    if params[:order][:address] == "1"
      @order.post_code = current_.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current.first_name
      
      
    elsif params[:order][:address] == "2"
      shipping = Shipping.find(params[:order][:delivery_id])
      @order.postcode = shipping.postcode
      @order.address = shipping.address
      @order.name = shipping.name
    end
     
  end

  def index
    @order = Order.all
  end
  
  
  private
  def   order_params
    params.require(:order).permit(:name, :address, :total_price, :postage, :payment_method,:post_code)
  end
end
