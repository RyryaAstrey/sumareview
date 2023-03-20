class Public::SearchesController < ApplicationController
  before_action :search_template, only: [:search]
  
  def search
    
    # 検索処理
    ## 検索ワードがある時
    if params[:word].present?
      @items = Item.where("name LIKE?", "%#{params[:word]}%")
      @search_items = @items.where(is_draft: false).order('id DESC').page(params[:page]).per(10)
    ## 検索ワードが空の時、@itemsの配列を空にする 
    else
      @search_items = Item.none
    end
  end
end
