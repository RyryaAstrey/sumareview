class Public::InterestsController < ApplicationController
  
  def create
    @item = Item.find(params[:item_id])
    interest = current_user.interests.new(item_id: @item.id)
    interest.save
  end
  
  def destroy
    @item = Item.find(params[:item_id])
    interest = current_user.interests.find_by(item_id: @item.id)
    interest.destroy
  end
end
