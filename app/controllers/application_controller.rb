class ApplicationController < ActionController::Base
  
  
  protected
  
  # ログイン制限
  def autheniticate_admin
    unless admin_signed_in?
      flash[:warning] = "管理者ログインが必要です。"
      redirect_to new_admin_session_path
    end
  end
  
  def autheniticate_user
    unless user_signed_in?
      flash[:warning] = "ログインが必要な機能です。"
      redirect_to new_user_session_path
    end
  end
  # --ここまでログイン制限--
  
  # サイドバー関連の変数
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
  # --ここまでサイドバー関連の変数--
  
end
