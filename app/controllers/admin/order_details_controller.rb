class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = Order_detail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_detail_path(@order_detail.id)
  end
  
end
