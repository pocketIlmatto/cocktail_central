class IngredientsController < ApplicationController
  include IngredientsHelper
  before_action :set_ingredient, only: [:show]

  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = pimp_my_bar().paginate(page: params[:page]) 
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params[:ingredient][:ingredient_list] ||= []      
      params.require(:ingredient).permit(:name, ingredient_list: [])
    end   
    

    def pimp_my_bar()
      
      ingredient_list = []
      ingredient_list = params[:ingredient_list]
      
      if !ingredient_list.nil? 
        puts "brute forcing"
        @ingredients = brute_force(ingredient_list)      
                 
      else
        @ingredientss = Ingredient.all
        
      end
    end


end
