class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_toppage, only: [:index, :create]

  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_delivery).permit(:postal_code, :prefecture_id, :city, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_toppage
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

end
