class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]

  def index
    @itemscount = Item.all
    @items = Item.page(params[:page])
    @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.all
    @cart_item =CartItem
  end

end