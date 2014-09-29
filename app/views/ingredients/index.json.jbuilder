json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :name
  json.url ingredient_url(ingredient, format: :json)
end