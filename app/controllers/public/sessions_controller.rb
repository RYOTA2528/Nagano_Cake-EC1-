# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
    before_action :reject_inactive_customer, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def reject_inactive_customer
   @customer = Customer.find_by(email: params[:customer][:email].downcase)
   # paramsの後に[:customer]が入る理由は実際にターミナル上で確認するとParamerters：[～…　,"customer"=>{"email"=>"555555@gmail.com", "password"=>"[FILTERED]"}, "commit"=>"ログイン"} ]となっており、これはハッシュでありemailはcustomerという箱の中身であることさしてるため記載必要！
    if @customer
     if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted
      # 今回は、 &&の後に!をいれない理由としては、!=falseのことを差し、それが&&であればリダイレクトとなってしまう。今回は退会＝trueのためつけると逆にログインができるようになってしまうため。
      redirect_to new_customer_session_path
     end
    end
  end
end