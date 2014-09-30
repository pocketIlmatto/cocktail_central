# == Schema Information
#
# Table name: ingredients
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  display_name :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Ingredient < ActiveRecord::Base
	before_save { self.name = name.downcase }
	has_many :recipe_ingredients 
	has_many :recipes, :through => :recipe_ingredients #@ingredient.recipes
	

	# def ingredient_name
	# 	ingredient.name if ingredient
	# end

	# def ingredient_name=(name)
	# 	self.name = Ingredient.find_or_create_by_name(name) unless name.blank?
	# end
end
