class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!, except: [:contact]

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  private

    def customer_params
      params.require(:customer).permit(:name,:email)
    end

end
