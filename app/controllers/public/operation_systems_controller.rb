class Public::OperationSystemsController < ApplicationController
  before_action :search_template, only: [:show]
  
  def show
    @operation_system = OperationSystem.find(params[:id])
    if params[:latest]
      @operation_system_items = @operation_system.items.latest.where(is_draft: false).page(params[:page]).per(10)
    # 平均点昇順
    elsif params[:score_count]
      @operation_system_items = @operation_system.items.where(is_draft: false).each do |item| # 非公開記事を除く記事を取得し、配列にする
      end
      @operation_system_items = @operation_system_items.sort_by { |item| item.review_score_average }.reverse # sort_byで平均点順に並び直し、reverseで昇順になった配列を作る（review_score_averageはモデルで定義）。
      @operation_system_items = Kaminari.paginate_array(@operation_system_items).page(params[:page]).per(10) # @itemsは現状配列のため、Kaminari.pagenate_arrayを使ってページネーションを作る。
    # --ここまで平均点昇順--
    elsif params[:row_cost]
      @operation_system_items = @operation_system.items.row_cost.where(is_draft: false).page(params[:page]).per(10)
    else
      @operation_system_items = @operation_system.items.where(is_draft: false).page(params[:page]).per(10).order('id DESC')
    end
  end
end
