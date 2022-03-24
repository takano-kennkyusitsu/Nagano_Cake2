# frozen_string_literal: true
class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state,only: [:create]

  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインに成功しました。"
    root_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトに成功しました。"
    root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  # protected
=======

  # protected
=======
>>>>>>> 03c4a5119d69dab528751c8590392776c12b7d77

  # protected

<<<<<<< HEAD
=======
>>>>>>> origin/develop
>>>>>>> 00d783d25cd843de8d141a4cbe24ef6a8e9dc14f
=======
>>>>>>> b7fbf2b904022885b35bf4faacc6d2fc26ce8724
  # protected
>>>>>>> 02ea8e19fc7b6a9c537eff53ddc7da7e93fcf8f2
=======
>>>>>>> 03c4a5119d69dab528751c8590392776c12b7d77
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
end







=======
>>>>>>> 03c4a5119d69dab528751c8590392776c12b7d77

 def customer_state
 ## 【処理内容1】 入力されたemailからアカウントを1件取得
 @customer = Customer.find_by(email: params[:customer][:email])
 ## アカウントを取得できなかった場合、このメソッドを終了する
 return if !@customer
 ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
 if @customer.valid_password?(params[:customer][:password])
  if @customer.is_deleted == true
   redirect_to new_customer_registration_path
  end
 end
 end
end


<<<<<<< HEAD


<<<<<<< HEAD
<<<<<<< HEAD
=======
end
>>>>>>> a9f127f2230d12d40d4d8912e4cb5c86dabd6cce
=======
>>>>>>> 00d783d25cd843de8d141a4cbe24ef6a8e9dc14f
=======
end
>>>>>>> b7fbf2b904022885b35bf4faacc6d2fc26ce8724
=======
end
>>>>>>> 03c4a5119d69dab528751c8590392776c12b7d77
=======
>>>>>>> 1581d0956ccc24fce3b6472af3f1f7c0fcdbea98
