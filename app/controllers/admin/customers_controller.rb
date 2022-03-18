class Admin::CustomersController < ApplicationController
  def show
  end

  def index
    @customers = Customer.all
  end

  def edit
  end

  def update
  end
end
