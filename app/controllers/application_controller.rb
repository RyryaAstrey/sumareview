class ApplicationController < ActionController::Base
  
  
  protected
  
  def admin_url
    request.fullpath.include?("/admin")
  end
  
  def autheniticate_user
    if @current_user == nil
      flash[:warning] = "ログインが必要です。"
      redirect_to new_user_session_path
    end
  end
  
  def search_template
    @makers = Maker.all
    @operation_systems = OperationSystem.all
    
    # 新着記事リスト用の処理
    
    ## URLにadminが含まれている場合
    if request.path.match(/\/admin(\/)?/)
      @new_list_items = Item.order('id DESC').limit(5)
    else
      ## whereメソッドで下書きステータスがfalse（公開済み）の記事のみ取得
      @publicize_items = Item.where(is_draft: false)
      @new_list_items = @publicize_items.order('id DESC').limit(5)
    end
  end
  
end
