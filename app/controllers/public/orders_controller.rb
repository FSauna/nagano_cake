class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.find(params[:id])
  end
  
  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.shipping_cost = 800

    if params[:order][:select_address] == "0" #ご自身の住所
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:select_address] == "1" #登録済み住所
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name

    elsif params[:order][:select_address] == "2" #新しいお届け先
       @order.postal_code = params[:order][:postal_code]
       @order.address = params[:order][:address]
       @order.name = params[:order][:name]
    end
  end
  
  def thanks
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id =  @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.subtotal
      @order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_complete_path
  end
  
  def index
    @orders = current_customer.orders.page(params[:page]).per(8)
  end
  
  def show
  end
  
  private
  def order_params
      params.require(:order).permit(:order_id, :payment_method, :ordered_postal_code, :ordered_adresses, :ordered_name)
  end

  
end
