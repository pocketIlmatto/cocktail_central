class RenameItemIdToIngredientId < ActiveRecord::Migration
  def change
  	rename_column :recipes_ingredients, :item_id, :ingredient_id
  end
end
