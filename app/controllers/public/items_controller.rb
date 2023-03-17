class Public::ItemsController < ApplicationController
  before_action :search_template, only: [:index, :show]
  
  def index
    @items = Item.where(is_draft: false).page(params[:page]).per(10).order('id DESC')
  end

  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.order('id DESC')
  end
  
end
