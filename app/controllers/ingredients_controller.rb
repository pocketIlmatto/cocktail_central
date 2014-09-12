class IngredientsController < ApplicationController
  
  def index
    
  end

  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.create(ingredient_params)

    @item = Item.find_or_initialize_by(name: ingredient_params['name'])
    @item.save
    
    
    respond_to do |format|
      if @ingredient.save
        @ingredient.update_attribute(:item_id, @item.id)
        #format.html { redirect_to([@ingredient.recipe, @ingredient]), notice: 'Ingredient was successfully created.' }
        format.html { redirect_to(@ingredient.recipe), notice: 'Ingredient was successfully created.' }
        #format.json { render action: 'show', status: :created, location: [@ingredient.recipe, @ingredient]}
      else
        redirect_to(@ingredient.recipe)
        #format.html { render action: 'new' }
        #format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

    

  
  
  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:recipe_id, :item_id, :qty, :uom, :name)
    end
end
