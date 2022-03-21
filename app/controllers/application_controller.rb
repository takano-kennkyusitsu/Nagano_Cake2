class ApplicationController < ActionController::Base
  before_action :customer_state, only: [:create]
# POST /resource/sign_in
  def create
   @customer = Customer.new(configure_sign_in_params)
   #customer_state
   @customer.save
   redirect_to “products_path”
  end
 # DELETE /resource/sign_out
 # def destroy
 #  super
 # end
  protected
 # If you have extra params to permit, append them to the sanitizer.
 def configure_sign_in_params
  devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
 end
 def customer_state
 ## 【処理内容1】 入力されたemailからアカウントを1件取得
 @customer = Customer.find_by(email: params[:customer][:email])
 ## アカウントを取得できなかった場合、このメソッドを終了する
 return if !@customer
 ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
 if @customer.valid_password?(params[:customer][:password])
 if @customer.is_deleted == true
    redirect_to  new_customer_registration_path
 end
 end
 end
end
