class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)

    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
       cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
       cart_item.quantity += params[:cart_item][:quantity].to_i
       cart_item.save
       redirect_to cart_items_path
    elsif @cart_item.save
      @cart_items = current_customer.cart_items.all
      redirect_to cart_items_path
    else
      @cart_items = current_customer.cart_items.all
      redirect_to cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:cart_item][:quantity])
    @cart_items = CartItem.all
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    @cart_items = CartItem.all
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = current_customer.cart_items.all
    cart_items.destroy_all
    @cart_items = current_customer.cart_items.all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end
end