class OrdersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_order, only: [:index, :create]
  before_action :order_filter, only:[:index]

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_order
    @item = Item.find(params[:item_id])
  end


  def order_params
    params.require(:order_address).permit(:zip_code, :prefecture_id, :city, :street_address, :building_name, :phone_number ,:item_id
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order_filter
    if @item.order.present? 
       redirect_to root_path 
    elsif user_signed_in? && current_user.id == @item.user_id
       redirect_to root_path
    end
  end


end
