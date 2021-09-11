class Public::RecipesController < ApplicationController

 
  
  def index
    @recipes = Recipe.all
    @genres = Genre.all
    @all_ranks = Recipe.find(Like.group(:recipe_id).order('count(recipe_id) desc').limit(10).pluck(:recipe_id))
  end
  

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.customer_id = current_customer.id
    @recipe.save
    redirect_to recipes_path
  end

  def edit
    @recipe = Recipe.find(params[:id])
    if @recipe.customer == current_customer
        render "edit"
    else
        redirect_to recipes_path
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.customer_id = current_customer.id
     if @recipe.update(recipe_params)
       flash[:succes]= "You have created book successfully."
       redirect_to recipe_path(@recipe.id)
     else
       flash[:notice]= 'errors prohibited this obj from being saved:'
       render "edit"
     end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end
  
  def rank
    @all_ranks = Recipe.find(Like.group(:recipe_id).order('count(recipe_id) desc').limit(10).pluck(:recipe_id))
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name,:image,:ingredient,:process,genre_ids: [])
  end

end

