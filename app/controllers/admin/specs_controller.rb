class Admin::SpecsController < ApplicationController
  # ログイン制限
  before_action :authenticate_admin!, if: :admin_url, only: [:edit]
  
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
    @spec = Spec.find(params[:id])
  end

  def update
    @spec = Spec.find(params[:id])
    if @spec.update(spec_params)
      redirect_to admin_categories_path
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{@spec.errors.full_messages.join('<br>・')}"
      redirect_to edit_admin_spec_path(@spec.id)
    end
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
