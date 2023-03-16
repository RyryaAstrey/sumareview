class Admin::HomesController < ApplicationController
  # ログイン制限
  before_action :authenticate_admin!, if: :admin_url, only: [:top]
  
  before_action :search_template, only: [:top]
  def top
   @items = Item.all.page(params[:page]).per(5)
  end
end
