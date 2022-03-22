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
    @order=Order.find(params[:id])
    #@order.postage =800
  end

  def thank_you
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.postage = 800
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @total_price = @order.postage + @total
  if params[:order][:address_number] == "1"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

  elsif params[:order][:address_number] == "2"
      shipping = Shipping.find(params[:order][:shipping_id])
      @order.postcode = shipping.postcode
      @order.address = shipping.address
      @order.name = shiping.name
  end 
  end

  def index
    @orders_all = Order.page(params[:page])
    @orders = current_customer.orders
  end
  
  
  private
  def   order_params
    params.require(:order).permit(:name, :address, :total_price, :postage, :payment_method,:postcode)
  end
end
