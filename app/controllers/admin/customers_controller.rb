class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customers_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :address, :tel, :postcode, :is_deleted)  
  end
end
