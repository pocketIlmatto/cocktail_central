module IngredientsHelper
	def brute_force (ingredient_list = [])	
	#ingredient_list = ["Lemon Juice", "Rye Whiskey", "Dry Vermouth", "Grand Marnier", "Orange Bitters", "American Whiskey", "Vodka", "Sweet Vermouth", "Tequila", "Dry Gin", "Maraschino Liqueur", "Calvados", "Old Tom Gin", "Cognac", "Angostura Bitters", "Benedictine DOM", "Coffee liqueur", "Orange Bitters (optional)"]
	#TODO refactor completely	
	ingredients = Ingredient.joins(:ingredients).where("items.name NOT IN (?) and ingredients.recipe_id in (?)", 
					ingredient_list.map(&:dowcase),
					Ingredient.joins(:item).where("items.name NOT IN (?)", 
						ingredient_list.map(&:downcase)).group('ingredients.recipe_id')
							.having('count(ingredients.recipe_id) <= 1').select("recipe_id")).group('ingredients.item_id').order('count(ingredients.item_id) DESC')
						
		
	
	end
end
