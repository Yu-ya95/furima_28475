class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    if user_signed_in?
      redirect_to '/' if (current_user.id == @item.user_id) || @item.purchase
    else
      redirect_to '/users/sign_in'
    end
    @purchase = PurchaseInformation.new
  end

  def create
    @purchase = PurchaseInformation.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to '/'
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_information).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number, :token).merge(user_id: current_user.id, item_id: @item.id, price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
