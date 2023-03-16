class Admin::MakersController < ApplicationController
  # ログイン制限
  before_action :autheniticate_admin, only: [:edit]
  
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
    @maker = Maker.find(params[:id])
  end

  def update
    @maker = Maker.find(params[:id])
    if @maker.update(maker_params)
      redirect_to admin_categories_path
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{@maker.errors.full_messages.join('<br>・')}"
      redirect_to edit_admin_maker_path(@maker.id)
    end
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
