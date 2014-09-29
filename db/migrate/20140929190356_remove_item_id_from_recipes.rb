class RemoveItemIdFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :item_id
  end

  def down
    add_column :recipes, :item_id, :integer
  end
end
