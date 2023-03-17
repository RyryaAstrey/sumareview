class Admin::HomesController < ApplicationController
  # ログイン制限
  before_action :autheniticate_admin, only: [:top]
  # before_action :authenticate_admin!, if: :admin_url, only: [:top]
  
  before_action :search_template, only: [:top]
  def top
   @items = Item.all.page(params[:page]).per(10).order('id DESC')
  end
end
