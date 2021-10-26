class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    #一つでも制作中になれば、注文ステータスも制作中に更新
    if @order_detail.making_status == "making"
      @order.update(ordered_status:"making")
    end
    #全て制作完了なら発送準備中に更新
    if @order.order_details.all?{|order_detail| order_detail.making_status == "completed"}
      @order.update(ordered_status: "preparing")
    end
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end