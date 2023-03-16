class Public::ItemsController < ApplicationController
  before_action :search_template, only: [:index, :show]
  
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @comments = Comment.all
    @items = Item.all
  end
  
end
