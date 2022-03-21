class Public::OrdersController < ApplicationController
  def new
   @order = Order.new
  end

 
  
  def create
  cart_items = customer.cart_items.all

  @order = customer.orders.new(order_params)
  if @order.save!
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
  end

  def thank_you
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address] == "1"
      @order.post_code = current.postcode
      @order.address = current.address
      @order.name = current.last_name + current.first_name
      
      
    elsif params[:order][:address] == "2"
      delivery = Delivery.find(params[:order][:delivery_id])
      @order.postcode = delivery.postcode
      @order.address = delivery.address
      @order.name = delivery.address_name
    end
     
  end

  def index
  end
  
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name)
  end
end
