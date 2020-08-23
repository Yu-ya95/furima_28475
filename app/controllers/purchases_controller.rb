class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:format])
  end

  def create
    redirect_to '/'
  end
end
