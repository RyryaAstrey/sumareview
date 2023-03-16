class Public::MakersController < ApplicationController
  before_action :search_template, only: [:index, :show]
  
  def show
    @maker = Maker.find(params[:id])
  end
end
