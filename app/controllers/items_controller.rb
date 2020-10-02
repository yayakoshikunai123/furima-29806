class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def create
    Item.create(item_params)
  end

  def update
  end

  def destroyquire
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :image, :expanation, :price ,:category_id, :product_status_id, :shipping_days_id, :shipping_fee_burden_id, :shipping_source_area_id).merge(user_id: current_user.id)
  end
end
