class Public::CartItemsController < ApplicationController
  def index
    @cart_items=CartItem.where(params[:customer_id])
    @sum = 0
  end

  def update
  end

  def destroy
  end

  def destoroy_all
  end

  def create
    if cart_item=CartItem.find_by(params[:cart_item][:product_id])
      cart_item.quantity += params[:cart_item][:quantity].to_i
      cart_item.save
    else
      cart_item=CartItem.new(cart_item_params)
      cart_item.save
    end
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :product_id, :quantity)
  end
end
