class Public::ItemsController < ApplicationController
  before_action :search_template, only: [:index, :show]
  
  def index
    if params[:latest]
      @items = Item.latest.where(is_draft: false).page(params[:page]).per(10)
    elsif params[:score_count]
      @items = Item.score_count.where(is_draft: false).page(params[:page]).per(10)
    elsif params[:row_cost]
      @items = Item.row_cost.where(is_draft: false).page(params[:page]).per(10)
    else
      @items = Item.where(is_draft: false).page(params[:page]).per(10).order('id DESC')
    end
  end

  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.order('id DESC')
    @images = @item.images
  end
  
end
