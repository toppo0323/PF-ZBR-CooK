class Admin::RecipesController < ApplicationController
  before_action :authenticate_admin!, except: [:edit, :update, :index, :show,:destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:succes]= "You have created book successfully."
      redirect_to admin_recipe_path(@recipe.id)
    else
      flash[:notice]= 'errors prohibited this obj from being saved:'
      render "edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to admin_recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name,:image,:ingredient,:process)
  end

end
