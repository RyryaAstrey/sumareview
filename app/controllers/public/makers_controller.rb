class Public::MakersController < ApplicationController
  before_action :search_template, only: [:show]
  
  def show
    @maker = Maker.find(params[:id])
    @maker_items = @maker.items.where(is_draft: false).page(params[:page]).per(10).order('id DESC')
  end
end
