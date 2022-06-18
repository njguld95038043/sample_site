class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    if @order_detail.update(order_detail_params)
      if order_detail_params[:making_status] == "in_production"
        @order.update(status: 2)
      end

      if @order.order_details.all? {|order_detail| order_detail.making_status == "complete_production"}
        @order.update(status: 3)
      end
      redirect_to admin_order_path(@order)
    else
      @order_details = OrderDetail.all
      @total = @order_details.inject(0) { |sum, item| sum + item.subtotal }
      @postage = @order.postage
      render 'admin/order/show'
    end
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end