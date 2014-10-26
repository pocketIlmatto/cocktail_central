class StaticPagesController < ApplicationController
  include IngredientsHelper
  def home
    @popular_ingredients = popular_ingredients(0,10)#Top 10
    @recipes = Recipe.search("Gin", limit: 1)
  end

  def about
  end

  def notfound
  end

  def search
  end

  private
  def static_params
      params[:ingredient_list] ||= []
  end
end
