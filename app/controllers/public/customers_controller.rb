class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!, except: [:contact]

  def index
    @customers =  Customer.joins(:recipes).group("recipes.customer_id").page(params[:page]).per(10)
    # 二つのテーブルをくっつけるjoins
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

  def likes
    @customer = Customer.find_by(id: params[:id])
      likes = Like.where(customer_id: @customer.id).pluck(:recipe_id)
    @like_recipes = Recipe.find(likes)
    # @like_recipes = Kaminari.paginate_array(@recipes).page(params[:page]).per(10)
    # いいね一覧のページネーションをしたかったが”undefined method `[]' for nil:NilClass”　のエラー
  end


  private

    def customer_params
      params.require(:customer).permit(:name,:email,:image,:introduction)
    end

end
