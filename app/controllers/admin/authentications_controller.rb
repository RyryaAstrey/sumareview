class Admin::AuthenticationsController < ApplicationController
  def create
    authentication = Authentication.new(authentication_params)
    if authentication.save
      redirect_to request.referer
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{authentication.errors.full_messages.join('<br>・')}"
      redirect_to request.referer
    end
  end

  def edit
  end

  def update
  end
  
  def destroy
    authentication = Authentication.find(params[:id])
    authentication.destroy
    redirect_to request.referer
  end
  
  private
  
  def authentication_params
    params.require(:authentication).permit(:name)
  end
end
