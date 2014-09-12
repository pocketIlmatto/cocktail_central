class AddIndexToRecipesName < ActiveRecord::Migration
  def change
  	add_index :recipes, :name, unique: false
  end
end
