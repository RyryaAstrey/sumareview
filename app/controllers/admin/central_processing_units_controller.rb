class Admin::CentralProcessingUnitsController < ApplicationController
  # ログイン制限
  before_action :autheniticate_admin, only: [:edit]
  
  def create
    central_processing_unit = CentralProcessingUnit.new(central_processing_unit_params)
    if central_processing_unit.save
      redirect_to request.referer
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{central_processing_unit.errors.full_messages.join('<br>・')}"
      redirect_to request.referer
    end
  end

  def edit
    @central_processing_unit = CentralProcessingUnit.find(params[:id])
  end

  def update
    @central_processing_unit = CentralProcessingUnit.find(params[:id])
    if @central_processing_unit.update(central_processing_unit_params)
      redirect_to admin_categories_path
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{@central_processing_unit.errors.full_messages.join('<br>・')}"
      redirect_to edit_admin_central_processing_unit_path(@central_processing_unit.id)
    end
  end
  
  def destroy
    central_processing_unit = CentralProcessingUnit.find(params[:id])
    central_processing_unit.destroy
    redirect_to request.referer
  end
  
  private
  
  def central_processing_unit_params
    params.require(:central_processing_unit).permit(:name)
  end
end
