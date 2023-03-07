class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admin_items_path
    else
      flash[:danger] = "入力内容に不備があります。<br>・#{@product.errors.full_messages.join('<br>・')}"
      redirect_to new_admin_item_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end
end
