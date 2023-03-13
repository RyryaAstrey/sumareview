class Admin::CommentsController < ApplicationController
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:success] = "コメントの削除に成功しました"
    redirect_to request.referer
  end
end
