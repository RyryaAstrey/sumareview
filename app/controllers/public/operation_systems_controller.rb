class Public::OperationSystemsController < ApplicationController
  
  def show
    @operation_system = OperationSystem.find(params[:id])
    @makers = Maker.all
    @operation_systems = OperationSystem.all
    
    # 新着記事リスト用の処理
    ## whereメソッドで下書きステータスがfalse（公開済み）の記事のみ取得
    @publicize_items = Item.where(is_draft: false)
    @items = @publicize_items.order('id DESC').limit(5)
  end
end
