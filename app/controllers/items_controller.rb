class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit , :update]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.valid? 
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.valid?
       @item.update(item_params)
       redirect_to root_path
    else
      render :edit
    end
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

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
