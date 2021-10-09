class Admin::CustomersController < ApplicationController
  def index
    @customer = current_user
    @customeres = User.all
  end
  def show
  end
  def edit
  end
  def update
  end
end
