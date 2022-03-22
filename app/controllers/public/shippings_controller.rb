class Public::ShippingsController < ApplicationController
<<<<<<< HEAD
=======

>>>>>>> a9f127f2230d12d40d4d8912e4cb5c86dabd6cce
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
<<<<<<< HEAD
end
=======
end
>>>>>>> a9f127f2230d12d40d4d8912e4cb5c86dabd6cce
