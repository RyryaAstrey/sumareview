class Public::OperationSystemsController < ApplicationController
  before_action :search_template, only: [:show]
  
  def show
    @operation_system = OperationSystem.find(params[:id])
  end
end
