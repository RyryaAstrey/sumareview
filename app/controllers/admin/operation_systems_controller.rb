class Admin::OperationSystemsController < ApplicationController
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
  end

  def update
  end
  
  private
  
  def operation_system_params
    params.require(:operation_system).permit(:name)
  end
end
