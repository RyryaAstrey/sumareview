# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]
  
  def guest_sign_in
    user = User.guest
    sign_in user
    flash[:notice] = "ゲストユーザーとしてログインしました。"
    redirect_to root_path
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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  protected
  
  # 退会しているかを判断するメソッド
  def customer_state
    # ログイン時に入力されたEメールに対応するユーザーが存在するかを探す
    @user = User.find_by(email: params[:user][:email])
    if @user
      # 入力されたパスワードが正しく、退会済みの場合
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
        flash[:danger] = "退会済みのアカウントです。<br>再度ご利用になりたい場合は管理人までご連絡ください。"
          redirect_to request.referer
      end
    end
  end
  
end
