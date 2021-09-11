class Public::SearchesController < ApplicationController

  def search
    if params["genre"]
      @recipes = Genre.find(params["genre"]).recipes.all
    else
      @recipes = Recipe.search(params[:keyword])
    end
    @keyword = params[:keyword]
  end


end