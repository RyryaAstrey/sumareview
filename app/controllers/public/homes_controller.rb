class Public::HomesController < ApplicationController
  
  def top
    @makers = Maker.all
    @operation_systems = OperationSystem.all
    @q = Item.ransack(params[:q])
    
    # 新着記事リスト用の処理
    ## whereメソッドで下書きステータスがfalse（公開済み）の記事のみ取得
    @publicize_items = Item.where(is_draft: false)
    @new_list_items = @publicize_items.order('id DESC').limit(5)
  end

end
