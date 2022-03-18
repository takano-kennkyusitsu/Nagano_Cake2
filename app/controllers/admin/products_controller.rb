class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new

  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to @product
  end
  
  def index
    @products = Product.all
    
  end

  def show
    @product = Product.find(params[:id])
    
  end

 

  def edit
    @product = Product.find(params[:id])
  end

  def update
  end
  
  private
  def product_params
    params.require(:product).permit(:janre_id, :name, :about, :image, :price, :is_active)  
  end
end
