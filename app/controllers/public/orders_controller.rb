class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.find(params[:id])
  end
  
  def confirm
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
  end
  
  def thanks
  end
  
  def create
  end
  
  def index
  end
  
  def show
  end
  
  private
  def order_params
      params.require(:order).permit(:order_id, :payment_method, :ordered_postal_code, :ordered_adresses, :ordered_name)
  end

  
end
