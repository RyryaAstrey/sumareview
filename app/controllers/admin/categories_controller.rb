class Admin::CategoriesController < ApplicationController
  # ログイン制限
  before_action :autheniticate_admin, only: [:index]
  
  def index
    # 入力フォーム生成
    @operation_system = OperationSystem.new
    @spec = Spec.new
    @maker = Maker.new
    @capacity = Capacity.new
    @central_processing_unit = CentralProcessingUnit.new
    @authentication = Authentication.new
    
    # 一覧生成
    @operation_systems = OperationSystem.all
    @specs = Spec.all
    @makers = Maker.all
    @capacities = Capacity.all
    @central_processing_units = CentralProcessingUnit.all
    @authentications = Authentication.all
  end
end
