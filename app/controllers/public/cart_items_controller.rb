class Public::CartItemsController < ApplicationController
  def index
    @cart_items=CartItem.where(params[:customer_id])
    @sum = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = "#{@cart_item.product.name}の個数を変更しました。"
      redirect_to cart_items_path
    else
    end
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end


def create

      if cart_item=CartItem.find_by(product_id: params[:cart_item][:product_id])
        cart_item.quantity += params[:cart_item][:quantity].to_i
        cart_item.save
        redirect_to cart_items_path
      else
        cart_item=CartItem.new(cart_item_params)
        if customer_signed_in?
          cart_item.customer_id = current_customer.id
          cart_item.save
          redirect_to cart_items_path
        else
           redirect_to root_path
        end
      end

end



  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :product_id, :quantity)
  end
end