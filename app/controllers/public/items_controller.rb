class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @comments = Comment.all
    
    # 新着記事リスト用の処理
    ## whereメソッドで下書きステータスがfalse（公開済み）の記事のみ取得
    @publicize_items = Item.where(is_draft: false)
    @items = @publicize_items.order('id DESC').limit(5)
  end
end
