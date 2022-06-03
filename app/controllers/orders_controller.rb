class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end


  def confirm
    @cart_items = current_customer.cart_items.all
    @postage = 800
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @total_price = @total + @postage
    if params[:order][:select_address] == "0"
      @order = Order.new
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.family_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @order = Order.new
      @delivery = Delivery.find(params[:order][:delivery_id])
      @order.postal_code = @delivery.postal_code
      @order.address = @delivery.address
      @order.name = @delivery.name
    elsif params[:order][:select_address] == "2"
      @order = Order.new(order_params)
    else
      flash[:notice] = "配送先を選択してください"
      @order = Order.new(order_params)
      render :new
    end
  end

  def back
    @order = Order.new
    render :new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

    if @order.save
      flash[:notice] = "注文を受け付けました"
      if params[:order][:select_address] == "2"
        @delivery = Delivery.new
        @delivery.customer_id = current_customer.id
        @delivery.name = @order.name
        @delivery.postal_code = @order.postal_code
        @delivery.address = @order.address
        @delivery.save
      end
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @orderdetail = OrderDetail.new
        @orderdetail.item_id = cart_item.item_id
        @orderdetail.order_id = @order.id
        @orderdetail.purchase_price = cart_item.item.with_tax_price
        @orderdetail.quantity = cart_item.quantity
        @orderdetail.save
      end
      @cart_items.destroy_all
      redirect_to orders_complete_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def complete
  end

  def index
    @orders=current_customer.orders.all
  end

  def show
    @order=current_customer.orders.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :total_price)
  end
end