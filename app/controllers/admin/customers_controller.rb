class Admin::CustomersController < ApplicationController
  def index
    @customers = Customers.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customers.find(params[:id])
  end

  def edit
    @customer = Customers.find(params[:id])
  end

  def update
    @customer = Customers.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_custmer_path(@customer.id)
  end
  
  private

    def customer_params
      params.require(:customer).permit(:name,:email)
    end
    
end
