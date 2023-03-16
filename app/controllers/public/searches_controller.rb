class Public::SearchesController < ApplicationController
  before_action :search_template, only: [:search]
  
  def search
    
    # 検索処理
    ## 検索ワードがある時
    if params[:word].present?
      @items = Item.where("name LIKE?", "%#{params[:word]}%")
    ## 検索ワードが空の時、@itemsの配列を空にする 
    else
      @items = Item.none
    end
  end
end
