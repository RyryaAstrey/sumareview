class Public::MakersController < ApplicationController
  
  def show
    @makers = Maker.all
    @maker = Maker.find(params[:id])
    @operation_systems = OperationSystem.all
    
    # 新着記事リスト用の処理
    ## whereメソッドで下書きステータスがfalse（公開済み）の記事のみ取得
    @publicize_items = Item.where(is_draft: false)
    @items = @publicize_items.order('id DESC').limit(5)
    
    # 検索フォーム用
    @q = Item.ransack(params[:q])
  end
end
