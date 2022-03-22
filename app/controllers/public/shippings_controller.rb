class Public::ShippingsController < ApplicationController

  def create
    shipping = Shipping.new(shipping_params)
    shipping.customer_id = current_customer.id
    shipping.save!
    redirect_to shippings_path
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    shipping = Shipping.find(params[:id])
    shipping.save
    redirect_to shippings_path
  end

  def index
    @shipping = Shipping.new
    @shippings = Shipping.where(params[:current_customer_id])
  end

  def destroy
    shipping = Shipping.find(params[:id])
    shipping.destroy
    redirect_to shippings_path
  end

  private

  def shipping_params
    params.require(:shipping).permit(:customer_id, :address, :postcode, :name)
  end
end
