class Public::CustomersController < ApplicationController
  
  def show
    @cutomer = current_customer
  end
  
  def edit
    @cutomer = current_customer
  end
  
  def update
    @cutomer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_page_path(@customer)
  end
  
  def unsubscribe
  end
  
  def withdraw
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end
  
end
