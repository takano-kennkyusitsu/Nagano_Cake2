class Public::ShippingsController < ApplicationController
  def create
    shipping = Shipping.new(shipping_params)
    shipping.save
  end

  def edit
  end

  def update
  end

  def index
    @shipping = Shipping.new
    @shippings = Shipping.where(params[:customer_id])
  end

  def destroy
  end

  private

  def shipping_params
    params.require(:shipping).permit(:customer_id, :address, :postcode, :name)
  end
end