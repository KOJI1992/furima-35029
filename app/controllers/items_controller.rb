class ItemsController < ApplicationController
  def index
  end

  private
  def items_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :quality_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
