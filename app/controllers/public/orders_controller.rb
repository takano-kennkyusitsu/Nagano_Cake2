class Public::OrdersController < ApplicationController
  def new
   @order = Order.new
  end

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
      @order.name = shipping.name
  end
 end




   def index
    @orders_all = Order.page(params[:page])
    @orders = current_customer.orders
   end


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

  def thank_you
  end





  private

  def   order_params
    params.require(:order).permit(:name, :address, :total_price, :postage, :payment_method,:postcode)
  end

end