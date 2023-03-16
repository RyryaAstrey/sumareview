class Admin::OperationSystemsController < ApplicationController
  # ログイン制限
  before_action :autheniticate_admin, only: [:edit]
  
  def create
    operation_system = OperationSystem.new(operation_system_params)
    if operation_system.save
      redirect_to request.referer
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{operation_system.errors.full_messages.join('<br>・')}"
      redirect_to request.referer
    end
  end

  def edit
    @operation_system = OperationSystem.find(params[:id])
  end

  def update
    @operation_system = OperationSystem.find(params[:id])
    if @operation_system.update(operation_system_params)
      redirect_to admin_categories_path
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{@operation_system.errors.full_messages.join('<br>・')}"
      redirect_to edit_admin_operation_system_path(@operation_system.id)
    end
  end
  
  def destroy
    operation_system = OperationSystem.find(params[:id])
    operation_system.destroy
    redirect_to request.referer
  end
  
  private
  
  def operation_system_params
    params.require(:operation_system).permit(:name)
  end
end
