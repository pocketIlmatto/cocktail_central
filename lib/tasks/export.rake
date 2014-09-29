

namespace :export do

  desc "Parses JSON files into a seeds.rb way."
  task :create_seeds => :environment do
    #Open each JSON file
    require 'rubygems'
    require 'json'
    localCount = 0

    Dir.glob('vendor/recipes/*.json') do |item|
      #localCount += 1
      #if localCount % 4 == 0
      #  addTest = true
      #else
        addTest = false
      #end

      if valid_json?(File.read(item))
        recipe = JSON.parse(File.read(item))
        if recipe.has_key?("name")
          @name = recipe['name']
        end


        if recipe.has_key?("name")
            
          puts "@recipe = Recipe.find_or_initialize_by(name: \"#{@name}\")"
          puts "@recipe.save"

          ingredientList = recipe['ingredients']
          if ingredientList.is_a?(Array)
            getIngredient(ingredientList, addTest, true)
          end
        end
      end
    end #end block

    
    cocktailShakerFile1 = File.read('vendor/moreRecipes/recipes.json')
    if valid_json?(cocktailShakerFile1)
      JSON.parse(cocktailShakerFile1).each do |x|
        if x.has_key?("name")
          @name = x['name']
          puts "@recipe = Recipe.find_or_initialize_by(name: \"#{@name}\")"
          puts "@recipe.save"

          ingredientList = x['ingredients']
          if ingredientList.is_a?(Array)
            getIngredient(ingredientList, false, false)
          end
        end
      end
    end


  end #end task

  def valid_json? json_
    JSON.parse(json_)
    return true
  rescue JSON::ParserError
    return false
  end

  def getIngredient(h, addTest, includeAmounts)

      h.each do |k,v|
        # If v is nil, an array is being iterated and the value is k.
        # If v is not nil, a hash is being iterated and the value is v.
        #
        value = v || k
        if value.is_a?(Hash)

          if value.has_key?("ingredientName")
            @ingredientName = value['ingredientName']
          elsif value.has_key?("name")
            @ingredientName = value['name']
          end
        
          if value.has_key?("amountUnits")
            @amountUnits = value['amountUnits']
          end
          if value.has_key?("amount")
            @amount = value['amount'].to_s
          end

          #TODO Need some validation here, but skipping it for now        
          puts "@ingredient = Ingredient.find_or_initialize_by(name: \"#{@ingredientName.downcase}\")"
          puts "@ingredient.display_name = \"#{@ingredientName}\""
          puts "@ingredient.save"

          #TODO item creation should be create or update here
          if includeAmounts
            puts "@recipe_ingredient = @ingredient.recipe_ingredients.build(uom: \"#{@amountUnits}\", qty: \"#{@amount}\")"  
          else
            puts "@recipe_ingredient = @ingredient.recipe_ingredients.build(uom: \"#{@amountUnits}\", qty: \"1\")"          
          end
          puts "@recipe_ingredient.save"
          puts "@recipe_ingredient.update_attribute(:recipe_id, @recipe.id)"
        end

        if value.is_a?(Hash) || value.is_a?(Array)
          getIngredient(value, addTest, includeAmounts)
        end
      end
    end



end

namespace :db do

  desc 'This rebuilds development db'
  task :rebuild_dev do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end
end
