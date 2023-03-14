class Admin::SearchesController < ApplicationController
  def search
    @range = params[:range]
    if @range == "item"
      @item_names = Item.search(params[:word])
    else
      @maker_names = Maker.search(params[:word])
    end
  end
end
