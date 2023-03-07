class Public::UsersController < ApplicationController
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

  def withdrawl
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
