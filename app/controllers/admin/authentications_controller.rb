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
    @authentication = Authentication.find(params[:id])
  end

  def update
    @authentication = Authentication.find(params[:id])
    if @authentication.update(authentication_params)
      redirect_to admin_categories_path
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{@authentication.errors.full_messages.join('<br>・')}"
      redirect_to edit_admin_authentication_path(@authentication.id)
    end
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
