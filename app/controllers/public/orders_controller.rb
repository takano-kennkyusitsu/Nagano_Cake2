class Public::OrdersController < ApplicationController
  def new
   @order = Order.new
  end
<<<<<<< HEAD



=======
 

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.postage = 800
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @total_price = @order.postage + @total
  if params[:order][:address_number] == "1"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

  elsif params[:order][:address_number] == "2"
      shipping = Shipping.find(params[:order][:shipping_id])
      @order.postcode = shipping.postcode
      @order.address = shipping.address
      @order.name = shiping.name
  end 
  
  
>>>>>>> origin/develop
  def create
   @order = current_customer.orders.new(order_params)
   @order.save
   @cart_items = current_customer.cart_items.all
     @cart_items.each do |cart_item|
        @order_items = @order.order_details.new
        @order_items.product_id = cart_item.product.id
        @order_items.tax_in_price = cart_item.product.in_tax_price
        @order_items.quantity = cart_item.quantity
        @order_items.save
         current_customer.cart_items.destroy_all
     end
  end
  end
  
   def show
    @order=current_customer.orders.find(params[:id])
   end

  def thank_you
  end

<<<<<<< HEAD
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
      @orders = current_customer.orders.page(params[:page])
=======
  def index
    @orders_all = Order.page(params[:page])
    @orders = current_customer.orders
>>>>>>> origin/develop
  end


  private
  def   order_params
    params.require(:order).permit(:name, :address, :total_price, :postage, :payment_method,:postcode)
  end
end
