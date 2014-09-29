# == Schema Information
#
# Table name: recipes_ingredients
#
#  id         :integer          not null, primary key
#  recipe_id  :integer
#  item_id    :integer
#  qty        :float
#  uom        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class RecipesIngredients < ActiveRecord::Base
	belongs_to :recipe
	belongs_to :item
	validates :recipe_id, presence: true
	validates :item_id, presence: true
end
