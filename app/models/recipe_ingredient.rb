# == Schema Information
#
# Table name: recipes_ingredients
#
#  id            :integer          not null, primary key
#  recipe_id     :integer
#  ingredient_id :integer
#  qty           :float
#  uom           :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class RecipeIngredient < ActiveRecord::Base
	
	belongs_to :recipe
	belongs_to :ingredient
	validates :recipe_id, presence: true
	validates :ingredient_id, presence: true

	accepts_nested_attributes_for :ingredient,
								  :reject_if => :all_blank

	# attr_accessor :name
	
	# def name
	#  	self.ingredient.name unless self.ingredient.nil?
	# end

	
end
