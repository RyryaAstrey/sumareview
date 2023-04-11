class Public::UsersController < ApplicationController
  # ログイン制限
  before_action :autheniticate_user, only: [:new] # application_controllerに記述
  
  before_action :ensure_guest_user, only: [:show, :edit, :check]
  
  def show
    interests = Interest.where(user_id: current_user.id).order('created_at DESC').pluck(:item_id)
    @interest_list = Item.find(interests)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    user= User.find(current_user.id)
    if user.update(user_params)
      redirect_to users_path
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{user.errors.full_messages.join('<br>・')}"
      redirect_to request.referer
    end
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
