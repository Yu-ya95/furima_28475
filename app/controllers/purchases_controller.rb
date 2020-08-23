class PurchasesController < ApplicationController
  def index
    if user_signed_in?
      @item = Item.find(params[:format])
    else
      redirect_to '/users/sign_in'
    end
  end

  def create
    redirect_to '/'
  end
end
