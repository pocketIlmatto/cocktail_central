module IngredientsHelper
	def brute_force (ingredient_list = [])	
	#ingredient_list = ["Lemon Juice", "Rye Whiskey", "Dry Vermouth", "Grand Marnier", "Orange Bitters", "American Whiskey", "Vodka", "Sweet Vermouth", "Tequila", "Dry Gin", "Maraschino Liqueur", "Calvados", "Old Tom Gin", "Cognac", "Angostura Bitters", "Benedictine DOM", "Coffee liqueur", "Orange Bitters (optional)"]
	#TODO refactor completely	
	ingredients = Ingredient.joins(:recipe_ingredients).where("ingredients.name NOT IN (?) and recipe_ingredients.recipe_id in (?)", 
					ingredient_list.map(&:downcase),
					RecipeIngredient.joins(:ingredient).where("ingredients.name NOT IN (?)", 
						ingredient_list.map(&:downcase)).group('recipe_ingredients.recipe_id')
							.having('count(recipe_ingredients.recipe_id) <= 1')
							.select("recipe_id"))
							.select("ingredients.id", "count(ingredients.id)", "display_name")
							.group('ingredients.id')
							.order('count(ingredients.id) DESC')
	end
end
