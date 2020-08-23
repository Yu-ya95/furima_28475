class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show]
  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to '/users/sign_in'
    end
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to '/'
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to action: :show
    else
      render :edit
    end
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_text, :category_id, :status_id, :postage_id, :prefecture_id, :shipping_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
