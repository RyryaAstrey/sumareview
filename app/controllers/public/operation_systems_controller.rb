class Public::OperationSystemsController < ApplicationController
  before_action :search_template, only: [:show]
  
  def show
    @operation_system = OperationSystem.find(params[:id])
    if params[:latest]
      @operation_system_items = @operation_system.items.latest.where(is_draft: false).page(params[:page]).per(10)
    elsif params[:score_count]
      @operation_system_items = @operation_system.items.score_count.where(is_draft: false).page(params[:page]).per(10)
    elsif params[:row_cost]
      @operation_system_items = @operation_system.items.row_cost.where(is_draft: false).page(params[:page]).per(10)
    else
      @operation_system_items = @operation_system.items.where(is_draft: false).page(params[:page]).per(10).order('id DESC')
    end
  end
end
