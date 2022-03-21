class Public::OrdersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @order=current_customer.orders.find(params[:id])
  end

  def thank_you
  end

  def confirm
  end

  def index
  end
end
