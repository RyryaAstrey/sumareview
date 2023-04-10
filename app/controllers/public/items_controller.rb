class Public::ItemsController < ApplicationController
  before_action :search_template, only: [:index, :show]
  
  def index
    if params[:latest]
      @items = Item.latest.where(is_draft: false).page(params[:page]).per(10)
    # 平均点昇順
    elsif params[:score_count]
      @items = Item.where(is_draft: false).each do |item| # 非公開記事を除く記事を取得し、配列にする
      end
      @items = @items.sort_by { |item| item.review_score_average }.reverse # sort_byで平均点順に並び直し、reverseで昇順になった配列を作る（review_score_averageはモデルで定義）。
      @items = Kaminari.paginate_array(@items).page(params[:page]).per(10) # @itemsは現状配列のため、Kaminari.pagenate_arrayを使ってページネーションを作る。
    # --ここまで平均点昇順--
    elsif params[:row_cost]
      @items = Item.row_cost.where(is_draft: false).page(params[:page]).per(10)
    else
      @items = Item.where(is_draft: false).page(params[:page]).per(10).order('id DESC')
    end
  end

  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.order('id DESC').limit(5)
    @images = @item.images
  end
  
  def compare
  end
  
end
