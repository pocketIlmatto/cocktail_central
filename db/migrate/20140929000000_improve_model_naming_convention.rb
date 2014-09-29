class ImproveModelNamingConvention < ActiveRecord::Migration
  def change
    rename_table :ingredients,  :recipes_ingredients
    rename_table :items,  		:ingredients
  end 
end