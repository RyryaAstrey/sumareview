class Public::UsersController < ApplicationController
  # ログイン制限
  before_action :autheniticate_user, only: [:new]
  # ゲストユーザーで会員情報編集ができないようにする制限
  before_action :ensure_guest_user, only: [:show, :edit]
  
  def show
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    user= User.find(current_user.id)
    user.update(user_params)
    redirect_to users_path
  end

  def check
  end

  def withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:thank_you] = "ご利用ありがとうございました。"
    redirect_to root_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
  
  # ゲストユーザーが会員情報を閲覧・編集できないようにする
  def ensure_guest_user
    @user = User.find(current_user.id)
    if @user.name == "ゲストユーザー"
      flash[:warning] = "ゲストユーザーのため、会員情報編集機能はご利用できません。"
      redirect_to root_path
    end
  end
  
end
