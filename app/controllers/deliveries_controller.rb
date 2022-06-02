class Public::DeliveriesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @delivery=Delivery.new
    @deliveries=current_customer.deliveries.all
  end

  def create
    @delivery=Delivery.new(delivery_params)
    @deliveries=current_customer.deliveries.all
    @delivery.customer_id=current_customer.id
    if @delivery.save
      flash[:notice] = "登録が完了しました。"
      redirect_to request.referer
    else
      flash[:alert] = "空欄は無効です。"
      render :index
    end
  end

  def edit
    @delivery=Delivery.find(params[:id])
  end

  def update
    @delivery=Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      flash[:notice] = "更新が完了しました。"
      redirect_to deliveries_path
    else
      flash[:alert] = "空欄は無効です。"
      render :edit
    end
  end

  def destroy
    @delivery=Delivery.find(params[:id])
    @delivery.destroy
    redirect_to request.referer
  end

  private

  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :name)
  end
end