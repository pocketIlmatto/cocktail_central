module RecipesHelper
  	def cocktail_image
	    	@images = Dir.glob('app/assets/images/cocktails/*.png')
	    	@random_image = @images[rand(@images.length)]
	    	@random_image["app/assets/images/cocktails/"]= ""
	    	image_tag("cocktails/#{@random_image}", size: "50x50", class: "gravatar")
  	end


  	#select * from recipes inner join ingredients on recipes.id = ingredients.recipe_id
		#inner join items on ingredients.item_id = items.id
		#where items.name = "Angostura Bitters"
  	def filter_recipes_by_ingredient (ingredient_name = "")
  		#@recipes = Recipe.all
  		@recipes = Recipe.joins(:recipe_ingredients).where(recipe_ingredients: { ingredient_id: ingredient_name })	  	
	end

	def filter_recipes_by_ingredient_list (ingredient_list = [])		
		#TODO refactor
		#ingredient_list = ["Rye Whiskey", "Dry Vermouth", "Grand Marnier", "Orange Bitters", "American Whiskey"]
		@recipes = Recipe.select("DISTINCT recipes.*").joins(:recipe_ingredients).where("recipes.id NOT IN (?)",
			RecipeIngredient.joins(:ingredient).where("ingredients.name NOT IN (?)", 
				ingredient_list.map(&:downcase)).select("recipe_id"))		
	end

	def filter_recipes_by_ingredient_list_inclusive (ingredient_list = [])		
		#TODO refactor
		#ingredient_list = ["Rye Whiskey", "Dry Vermouth", "Grand Marnier", "Orange Bitters", "American Whiskey"]
		@recipes = Recipe.select("DISTINCT recipes.*").joins(recipe_ingredients: :ingredient).where("ingredients.name IN (?)", 
				ingredient_list.map(&:downcase))		
	end

	def items_by_ingredient_list (ingredient_list = [])
		@ingredients = Ingredient.where("ingredients.name IN (?)",
				ingredient_list.map(&:downcase))		
	end

	
end

#["Lemon Juice", "Simple Syrup", "Egg white (optional)", "Angostura Bitters (optional)", "American Whiskey"])
		
#select recipeItems.name, recipes.id from recipes join items recipeItems on recipes.item_id = recipeItems.id 
#where recipes.id not in 
#(select i.recipe_id from ingredients i join items on i.item_id = items.id 
#	where items.name not in ("Lemon Juice", "Simple Syrup", "Egg white (optional)", "Angostura Bitters (optional)", "American Whiskey"))

#SELECT "recipes".* FROM "recipes" 
#	INNER JOIN "items" ON "items"."id" = "recipes"."item_id" 
#		WHERE (recipes.id NOT IN 
#				(SELECT recipe_id FROM "ingredients" 
#						INNER JOIN "items" ON "items"."id" = "ingredients"."item_id" 
#							WHERE (items.name NOT IN ('Lemon Juice','Simple Syrup','Egg white (optional)','Angostura Bitters (optional)','American Whiskey')))) 
#		ORDER BY name ASC LIMIT 30 OFFSET 0

