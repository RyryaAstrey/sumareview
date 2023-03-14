class Public::ItemsController < ApplicationController
  
  def index
    @q = Item.ransack(params[:q])
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @comments = Comment.all
    @q = Item.ransack(params[:q])
    @makers = Maker.all
    @operation_systems = OperationSystem.all
    @items = Item.all
    
    # 新着記事リスト用の処理
    ## whereメソッドで下書きステータスがfalse（公開済み）の記事のみ取得
    @publicize_items = Item.where(is_draft: false)
    @new_list_items = @publicize_items.order('id DESC').limit(5)
  end
  
  def search
    @makers = Maker.all
    @operation_systems = OperationSystem.all
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true).order("created_at DESC")
    
    # 新着記事リスト用の処理
    ## whereメソッドで下書きステータスがfalse（公開済み）の記事のみ取得
    @publicize_items = Item.where(is_draft: false)
    @new_list_items = @publicize_items.order('id DESC').limit(5)
  end
  
end
