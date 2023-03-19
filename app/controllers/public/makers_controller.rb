class Public::MakersController < ApplicationController
  before_action :search_template, only: [:show]
  
  def show
    @maker = Maker.find(params[:id])
    if params[:latest]
      @maker_items = @maker.items.latest.where(is_draft: false).page(params[:page]).per(10)
    elsif params[:score_count]
      @maker_items = @maker.items.score_count.where(is_draft: false).page(params[:page]).per(10)
    elsif params[:row_cost]
      @maker_items = @maker.items.row_cost.where(is_draft: false).page(params[:page]).per(10)
    else
      @maker_items = @maker.items.where(is_draft: false).page(params[:page]).per(10).order('id DESC')
    end
  end
end
