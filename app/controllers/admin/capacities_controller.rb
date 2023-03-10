class Admin::CapacitiesController < ApplicationController
  def create
    capacity = Capacity.new(capacity_params)
    if capacity.save
      redirect_to request.referer
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{capacity.errors.full_messages.join('<br>・')}"
      redirect_to request.referer
    end
  end

  def edit
  end

  def update
  end
  
  def destroy
    capacity = Capacity.find(params[:id])
    capacity.destroy
    redirect_to request.referer
  end
  
  private
  
  def capacity_params
    params.require(:capacity).permit(:name)
  end
end
