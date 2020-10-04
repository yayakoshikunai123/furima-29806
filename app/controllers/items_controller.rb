class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(
      :product_name, :image, :expanation, :price, :category_id, :product_status_id,
       :shipping_day_id, :shipping_fee_burden_id, :shipping_source_area_id,
      ).merge(user_id: current_user.id)
  end
end
