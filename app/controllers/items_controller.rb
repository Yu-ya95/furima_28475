class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :user_judge, only: [:edit, :destroy]
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

  def destroy
    @item.destroy
    redirect_to '/'
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_text, :category_id, :status_id, :postage_id, :prefecture_id, :shipping_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_judge
    redirect_to '/' unless current_user.id == @item.user_id
  end
end
