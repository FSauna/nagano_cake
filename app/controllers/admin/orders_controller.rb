class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.ordered_status == "paid"
       @order.order_details.each do |order_detail|
         order_detail.update(making_status:"waiting")
       end
    end
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:ordered_status)
  end
end
