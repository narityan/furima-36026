class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    #@items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :introduction, :category_id, :condition_id, :payer_id, :prefecture_id,
                                 :preparation_id, :price, :image).merge(user_id: current_user.id)
  end
end
