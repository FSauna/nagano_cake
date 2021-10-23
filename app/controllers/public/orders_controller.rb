class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @addresses = current_customer.addresses
  end
  
  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.shipping_cost = 800

    if params[:order][:select_address] == "0" #ご自身の住所
       @order.ordered_postal_code = current_customer.postal_code
       @order.ordered_address = current_customer.address
       @order.ordered_name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:select_address] == "1" #登録済み住所
       @address = Address.find(params[:order][:address_id])
       @order.ordered_postal_code = @address.postal_code
       @order.ordered_address = @address.address
       @order.ordered_name = @address.name

    elsif params[:order][:select_address] == "2" #新しいお届け先
       @order.ordered_postal_code = params[:order][:ordered_postal_code]
       @order.ordered_address = params[:order][:ordered_address]
       @order.ordered_name = params[:order][:ordered_name]
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
      params.require(:order).permit(:payment_method, :ordered_postal_code, :ordered_adress, :ordered_name, :amount_billed, :customer_id)
  end
  
end
