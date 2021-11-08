class PurchasesController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :move_to_path, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new

  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :house_name, :building_name, :phone_number, ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id 
      redirect_to root_path
    end
  end

  def move_to_path
    @item = Item.find(params[:item_id])
    if @item.purchase.present?
      redirect_to root_path
    end
  end

end
