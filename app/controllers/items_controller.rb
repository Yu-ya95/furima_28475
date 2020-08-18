class ItemsController < ApplicationController
  def index
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to "/users/sign_in"
    end
  end

  def edit
  end

  def show
  end

  def create
    Item.create(item_params)
    redirect_to "/"
  end

  private
  def item_params
    params.require(:item).permit(:name, :item_text, :category_code, :status_code, :postage_code, :prefecture_code, :delivery_days_code, :price, :image).merge(user_id: current_user.id)
  end
end
