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
  
  def list_destroy
    @item = Item.find(params[:item_id])
    interest = current_user.interests.find_by(item_id: @item.id)
    interest.destroy
    user_interests = Interest.where(user_id: current_user.id).pluck(:item_id)
    @interest_list = Item.find(user_interests)
  end
  
end
