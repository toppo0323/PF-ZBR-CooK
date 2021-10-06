class Public::SearchesController < ApplicationController
before_action :authenticate_customer!, except: [:search]

  # keywordにサーチしたいものを代入、検索結果はモデルを参照
  def search
    if params["genre"]
      @recipes = Genre.find(params["genre"]).recipes.all
    else
      @recipes = Recipe.search(params[:keyword])
    end
    @keyword = params[:keyword]
  end


end