class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!, except: [:contact]

  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

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

  def recipelist
    @customer = Customer.find(params[:id])
    #binding.pry
  end


  private

    def customer_params
      params.require(:customer).permit(:name,:email,:image,:introduction)
    end

end
