class Public::ItemsController < ApplicationController
  before_action :search_template, only: [:index, :show]
  
  # 制限
  before_action :autheniticate_user, only: [:compare, :compare_result] # application_controllerに記述
  before_action :ensure_guest_user, only: [:compare, :compare_result]
  
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
    @item = Item.find(params[:item_id])
    interests = Interest.where(user_id: current_user.id).pluck(:item_id)
    @interest_list = Item.find(interests)
  end
  
  def compare_result
    @item = Item.find(params[:item_id])
    if params[:item2_id].blank?
      redirect_to request.referer
      flash[:danger] = "比較したい機種を選択してください。"
    else
      @item2= Item.find(params[:item2_id])
    end
    
    interests = Interest.where(user_id: current_user.id).pluck(:item_id)
    @interest_list = Item.find(interests)
  end
  
  private
  
  # ゲストユーザーが比較機能を利用できないようにする
  def ensure_guest_user
    @user = User.find(current_user.id)
    if @user.name == "ゲストユーザー"
      flash[:warning] = "比較機能の利用には気になるリストの作成が必要です。<br>気になるリストを作成するには、会員登録をする必要があります。"
      redirect_to root_path
    end
  end
  
end
