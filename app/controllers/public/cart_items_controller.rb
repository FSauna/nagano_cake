class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = current_customer.cart_items
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  def create
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      @cartitem = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]) #customer_id = current_customer.id は既に存在しているカラムなので不要。
      @cartitem.amount += params[:cart_item][:amount].to_i
      @cartitem.save
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to cart_items_path
    end
  end
  
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
