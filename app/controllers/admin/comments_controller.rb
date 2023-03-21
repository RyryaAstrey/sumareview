class Admin::CommentsController < ApplicationController
  # ログイン制限
  before_action :autheniticate_admin, only: [:index]
  
  before_action :search_template, only: [:index]
  
  def index
    @item = Item.find(params[:item_id])
    @comments = @item.comments.page(params[:page]).per(10).order('id DESC')
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:success] = "コメントの削除に成功しました"
    redirect_to request.referer
  end
end
