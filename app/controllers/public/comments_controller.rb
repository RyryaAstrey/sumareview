class Public::CommentsController < ApplicationController
  
  # ログイン制限
  before_action :autheniticate_user, only: [:new]
  # 一度コメントしたユーザーが再度コメントしないようにする制限
  before_action :done_comment, only: [:new]
  
  def new
    @comment = Comment.new
    @item = Item.find(params[:item_id])
  end
  
  
  def index
  end
  
  def create
    item = Item.find(params[:item_id])
    comment = current_user.comments.new(comment_params)
    comment.item_id = item.id
    if comment.save
      redirect_to item_path(item.id)
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{comment.errors.full_messages.join('<br>・')}"
      redirect_to request.referer
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:score, :comment)
  end
  
  def done_comment
    item = Item.find(params[:item_id])
    if Comment.where(user_id: current_user.id, item_id: item.id).exists?
      flash[:danger] = "一度コメントした記事にはコメントできません。"
      redirect_to request.referer 
    end
  end
end
