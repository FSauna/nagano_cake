class Public::CustomersController < ApplicationController
  
  def show
    @cutomer = current_customer
  end
  
  def edit
    @cutomer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
       flash[:notice] = "You have updated data successfully."
       redirect_to customers_my_page_path(@customer)
    else
       render :edit
    end
  end
  
  def unsubscribe
    @cutomer = current_customer
  end
  
  def withdraw
    @cutomer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end
  
end
