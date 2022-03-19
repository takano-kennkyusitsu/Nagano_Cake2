class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    redirect_to admin_product_path(@product)
    else
    render :new
    end
  end
  
  def index
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    
  end

  def edit
    @product = Product.find(params[:id])
    @genre = Genre.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
    #redirect_to admin_products_path
    else
    render:edit
    end
  end
  
  private
  def product_params
    params.require(:product).permit(:genre_id, :name, :about, :image, :price, :is_active)  
  end
end
