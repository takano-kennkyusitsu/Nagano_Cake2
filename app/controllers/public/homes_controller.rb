class Public::HomesController < ApplicationController
  def top
    @products = Product.order("RANDOM()").limit(4)
    @genres = Genre.all
  end

  def about
  end
end
