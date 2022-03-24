class Public::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page])
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end
