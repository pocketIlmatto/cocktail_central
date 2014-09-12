class Ingredient < ActiveRecord::Base
	belongs_to :recipe
	belongs_to :item
	validates :recipe_id, presence: true
	validates :item_id, presence: true
end
