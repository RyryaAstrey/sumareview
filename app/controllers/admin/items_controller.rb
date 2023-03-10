class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # 投稿ボタンを押下した場合
    if params[:post]
      if @item.save(context: :publicize)
        redirect_to request.referer
      else
        flash[:danger] = "入力内容に不備があります。<br>・#{@item.errors.full_messages.join('<br>・')}"
        redirect_to new_admin_item_path
      end
    # 下書きボタンを押下した場合
    else
      if @item.update(is_draft: true)
        redirect_to admin_root_path
      else
        flash[:danger] = "入力内容に不備があります。<br>・#{@item.errors.full_messages.join('<br>・')}"
        redirect_to new_admin_root_path
      end
    end
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private
  
  def item_params
    params.require(:item).permit(
      :operation_system_id,
      :central_processing_unit_id,
      :authentication_id,
      :spec_id,
      :maker_id,
      :capacity_id,
      :name,
      :explanation,
      :strength,
      :weakness,
      :core,
      :main_camera,
      :in_camera,
      :mobile_wallet,
      :release_date,
      :price,
      :battery,
      :display,
      :weight,
      :height,
      :width,
      :thickness,
      :memory,
      :waterploof,
      :wireless_chage,
      :near_field_communication,
      :is_draft
      )
  end
end
