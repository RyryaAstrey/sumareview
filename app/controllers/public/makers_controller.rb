class Public::MakersController < ApplicationController
  before_action :search_template, only: [:show] # application_controllerに記述
  
  def show
    @maker = Maker.find(params[:id])
    if params[:latest]
      @maker_items = @maker.items.latest.where(is_draft: false).page(params[:page]).per(10)
    # 平均点昇順
    elsif params[:score_count]
      @maker_items = @maker.items.where(is_draft: false).each do |item| # 非公開記事を除く記事を取得し、配列にする
      end
      @maker_items = @maker_items.sort_by { |item| item.review_score_average }.reverse # sort_byで平均点順に並び直し、reverseで昇順になった配列を作る（review_score_averageはモデルで定義）。
      @maker_items = Kaminari.paginate_array(@maker_items).page(params[:page]).per(10) # @itemsは現状配列のため、Kaminari.pagenate_arrayを使ってページネーションを作る。
    # --ここまで平均点昇順--
    elsif params[:row_cost]
      @maker_items = @maker.items.row_cost.where(is_draft: false).page(params[:page]).per(10)
    else
      @maker_items = @maker.items.where(is_draft: false).page(params[:page]).per(10).order('id DESC')
    end
  end
end
