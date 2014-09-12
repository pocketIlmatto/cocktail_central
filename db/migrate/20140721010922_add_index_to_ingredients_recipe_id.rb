class AddIndexToIngredientsRecipeId < ActiveRecord::Migration
  def change
  	add_index :ingredients, :recipe_id
  	add_index :ingredients, :item_id
  end
end
