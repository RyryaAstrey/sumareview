class Public::OperationSystemsController < ApplicationController
  before_action :search_template, only: [:show]
  
  def show
    @operation_system = OperationSystem.find(params[:id])
    @operation_system_items = @operation_system.items.where(is_draft: false).page(params[:page]).per(10)
  end
end
