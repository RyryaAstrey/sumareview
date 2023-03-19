class Admin::ItemsController < ApplicationController
  # ログイン制限
  before_action :autheniticate_admin, only: [:new, :show, :edit]
  
  before_action :search_template, only: [:show]
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # 投稿ボタンを押下した場合
    if params[:post]
      if @item.save(context: :publicize)
        redirect_to admin_root_path
      else
        flash[:danger] = "入力内容に不備があります。<br>・#{@item.errors.full_messages.join('<br>・')}"
        redirect_to request.referer
      end
    # 下書きボタンを押下した場合
    else
      if @item.update(is_draft: true)
        redirect_to admin_item_path(@item.id)
      else
        flash[:danger] = "入力内容に不備があります。<br>・#{@item.errors.full_messages.join('<br>・')}"
        redirect_to request.referer
      end
    end
  end

  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.order('id DESC')
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    # 下書き記事を公開する場合
    if params[:publicize_draft]
      # 記事公開時にはバリデーションを実施
      # updateメソッドにはcontextが使用できないため、公開処理時にはattributesとsaveメソッドを使用する。
      @item.attributes = item_params.merge(is_draft: false)
      if @item.save(context: :publicize)
        redirect_to admin_item_path(@item.id)
      else
        @item.is_draft = true
        flash[:danger] = "入力内容に不備があります。<br>・#{@item.errors.full_messages.join('<br>・')}"
        redirect_to request.referer
      end
      
    # 公開済み記事の更新をする場合
    elsif params[:update_item]
      @item.attributes = item_params
      if @item.save(context: :publicize)
        redirect_to admin_item_path(@item.id)
      else
        flash[:danger] = "入力内容に不備があります。<br>・#{@item.errors.full_messages.join('<br>・')}"
        redirect_to request.referer
      end
      
    # 下書き記事の更新（非公開のまま更新）の場合
    else
      if @item.update(item_params)
        redirect_to admin_item_path(@item.id)
      else
        flash[:danger] = "入力内容に不備があります。<br>・#{@item.errors.full_messages.join('<br>・')}"
        redirect_to request.referer
      end
    end
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
      :is_draft,
      images: []
      )
  end
end
