class RecipesController < ApplicationController
  include RecipesHelper
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  
  

  def new
    @recipe = Recipe.new
    3.times { @recipe.recipe_ingredients.build }
  end

  def show
    @recipe = Recipe.find(params[:id])
    #@ingredients = @recipe.ingredients.paginate(page: params[:page])    
  end

  def index
    #@recipes = Recipe.all.paginate(page: params[:page])
    @recipes = filter_by_ingredients().paginate(page: params[:page]) 
      
  end

  def create

    #TODO 
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        flash[:success] = "Recipe created!"
        format.html { redirect_to @recipe}
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    #TODO
    @recipe = Recipe.find(params[:id])
    # @ingredients = @recipe.ingredients.paginate(page: params[:page])    

    #@recipe_ingredients = @recipe.ingredients.paginate(page: params[:page])    
  end

  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
        if @recipe.update_attributes(recipe_params)
          flash[:success] = "Recipe edited"
          format.html { redirect_to @recipe}
          format.json { render action: 'show', status: :updated, location: @recipe }
        else
          format.html { render action: 'new' }
          format.json { render json: @recipe.errors, status: :unprocessable_entity }
        end
    end
  end

  def destroy
    Recipe.find(params[:id]).destroy
    flash[:success] = "Recipe deleted"
    redirect_to recipes_url
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    
    def recipe_params
      params[:recipe][:ingredient_list] ||= []
      params.require(:recipe).permit(:name, :id,  
                                      :search_ingredient, :search_type, 
                                      recipe_ingredients_attributes: [:id, :amount, :qty, :ingredient_id, :recipe_id, 
                                        ingredients_attributes: [:id, :name] ]) 
                                      #ingredient_list: [])
    end

    def filter_by_ingredients ()
      
      ingredient_list = []
      ingredient_list = params[:ingredient_list]
      
      #filters by a single ingredient
      if !params[:search_ingredient].nil? 
        @recipes = filter_recipes_by_ingredient(params[:search_ingredient])   

      #filters by a list of ingredients
      elsif !ingredient_list.nil? 
        if params[:search_type] == "inclusive"
          @recipes = filter_recipes_by_ingredient_list_inclusive(ingredient_list)     
        else
          @recipes = filter_recipes_by_ingredient_list(ingredient_list)
        end
                 
      #if no ingredients are passed, return the full recipe list
      else
        @recipes = Recipe.all
        
      end
    end
end
