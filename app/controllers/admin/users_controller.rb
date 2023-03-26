class Admin::UsersController < ApplicationController
  # ログイン制限
  before_action :autheniticate_admin, only: [:index, :show, :edit]
  
  # before_action :ensure_guest_user, only: [:edit] # ゲストユーザーの編集をできないようにするにはコメントアウトを外してください
  
  def index
    @users = User.all.page(params[:page]).per(10).order('id DESC')
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "会員情報の編集が完了しました。"
      redirect_to admin_user_path(@user.id)
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{@user.errors.full_messages.join('<br>・')}"
      redirect_to request.referer
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end
  
  # ゲストユーザーの会員情報を編集できないようにする
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "ゲストユーザー"
      flash[:warning] = "ゲストユーザーの会員情報は編集できません。"
      redirect_to request.referer
    end
  end
end
