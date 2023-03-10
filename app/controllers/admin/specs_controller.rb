class Admin::SpecsController < ApplicationController
  def create
    spec = Spec.new(spec_params)
    if spec.save
      redirect_to request.referer
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{spec.errors.full_messages.join('<br>・')}"
      redirect_to request.referer
    end
  end

  def edit
  end

  def update
  end
  
  def destroy
    spec = Spec.find(params[:id])
    spec.destroy
    redirect_to request.referer
  end
  
  def spec_params
    params.require(:spec).permit(:name)
  end
end
