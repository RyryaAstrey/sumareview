class Admin::MakersController < ApplicationController
  def create
    maker = Maker.new(maker_params)
    if maker.save
      redirect_to request.referer
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{maker.errors.full_messages.join('<br>・')}"
      redirect_to request.referer
    end
  end

  def edit
  end

  def update
  end
  
  def destroy
    maker = Maker.find(params[:id])
    maker.destroy
    redirect_to request.referer
  end
  
  def maker_params
    params.require(:maker).permit(:name)
  end
end
