class Public::CommentsController < ApplicationController
  
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
end
