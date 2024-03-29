class Admin::SearchesController < ApplicationController
  # ログイン制限
  before_action :autheniticate_admin, only: [:search]
  
  before_action :search_template, only: [:search]
  
  def search
    @range = params[:range]
    if @range == "Item"
      if params[:word].present?
        @items = Item.where("name LIKE?", "%#{params[:word]}%").page(params[:page]).per(10)
      ## 検索ワードが空の時、@itemsの配列を空にする 
      else
        @items = Item.none
      end
    else
      if params[:word].present?
        @users = User.where("name LIKE?", "%#{params[:word]}%").page(params[:page]).per(10)
      ## 検索ワードが空の時、@usersの配列を空にする 
      else
        @users = User.none
      end
    end
  end
end
