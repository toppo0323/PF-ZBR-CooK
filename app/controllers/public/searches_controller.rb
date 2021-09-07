class Public::SearchesController < ApplicationController

  def search
    @recipes = Recipe.search(params[:keyword])
    @keyword = params[:keyword]
  end


end