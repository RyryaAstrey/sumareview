class Public::CommentsController < ApplicationController
  before_action :search_template, only: [:index]
  
  # 制限
  before_action :autheniticate_user, only: [:new] # application_controllerに記述
  before_action :done_comment, only: [:new]
  before_action :correct_user, only: [:edit]
  
  def new
    @comment = Comment.new
    @item = Item.find(params[:item_id])
  end
  
  def edit
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:id])
  end
  
  def index
    @item = Item.find(params[:item_id])
    @comments = @item.comments.page(params[:page]).per(10).order('id DESC')
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
  
  def update
    @item = Item.find(params[:item_id])
    comment = Comment.find(params[:id])
    if comment.update(comment_params)
      flash[:success] = "コメントの編集が完了しました。"
      redirect_to item_path(@item.id)
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{comment.errors.full_messages.join('<br>・')}"
      redirect_to request.referer
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:score, :comment)
  end
  
  # コメントは１つの記事につき一回までの制限
  def done_comment
    item = Item.find(params[:item_id])
    if Comment.where(user_id: current_user.id, item_id: item.id).exists?
      flash[:danger] = "一度コメントした記事にはコメントできません。"
      redirect_to request.referer 
    end
  end
  
  # 他のユーザーがコメントを編集できないようにする制限
  def correct_user
    @comment = Comment.find(params[:id])
    @user = @comment.user
    @item = Item.find(params[:item_id])
    unless @user == current_user
      flash[:danger] = "他のユーザーのコメントを編集することはできません"
      redirect_to item_path
    end
  end
end
