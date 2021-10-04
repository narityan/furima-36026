class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only:[:show, :edit, :update]
  before_action :move_to_index, only: [:edit]


  def index
    @items = Item.all.order('created_at DESC')
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
    
    if @item.update(item_params)
      redirect_to item_path(@item.id), method: :get
    else
      render :edit
    end
  end

  def destroy
<<<<<<< HEAD

=======
>>>>>>> parent of 4140080 (削除機能実装)
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :introduction, :category_id, :condition_id, :payer_id, :prefecture_id,
                                 :preparation_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
