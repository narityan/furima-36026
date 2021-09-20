class ItemsController < ApplicationController

  def index
  end
  
  private

  def item_params
    params.require(:item).permit(:item_name, :introduction, :category_id, :condition_id, :payer_id, :prefecture_id, :preparation_id, :preice, :image).merge(user_id: current_user.id)
  end
end
