class Public::FavoritesController < ApplicationController
  
  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:comment_id])
    favorite = current_user.favorites.new(comment_id: @comment.id)
    favorite.save
  end
  
  def destroy
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:comment_id])
    favorite = current_user.favorites.find_by(comment_id: @comment.id)
    favorite.destroy
  end
end
