# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]
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

   protected
   
   def customer_state # 退会しているかを確認するメソッド
    @customer = Customer.find_by(email: params[:customer][:email]) 
    ## ↑入力されたemailからアカウントを1件取得
    return if !@customer
    # ↑アカウントを取得できなかった場合、このメソッドを終了する
    if @customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == true)
    ## ↑取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別し、active_for_authentication?をオーバーライドして論理削除されているユーザーを弾く
    flash[:error] = "このアカウントは退会済みです。"
    redirect_to new_customer_registration_path
    #　↑新規登録画面にリダイレクト
    end
   end
 
   
   def after_sign_in_path_for(resource)
     my_page_customers_path
   end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
