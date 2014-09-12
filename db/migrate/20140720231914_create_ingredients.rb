class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id
      t.integer :item_id
      t.float :qty
      t.string :uom

      t.timestamps
    end
  end
end
