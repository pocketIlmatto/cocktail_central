moveIngredient = (direction, id) ->
    if direction is 1
      $("#ingredient-"+id).data('direction', 0);
      $("#selected_ingredients").append($("#ingredient"+id))
    else
      $("#ingredient-"+id).data('direction', 1);
      $("#popular_ingredients").append($("#ingredient"+id))

$ ->
  $("a[data-direction]").click (e) ->
    moveDirection = $(this).data("direction")
    ingredientId = $(this).data("ingredient-id")
    
    moveIngredient(moveDirection, ingredientId)
  
$ ->
  $('#recipe_search').typeahead
    name: "recipe"
    remote: "/recipes/autocomplete?query=%QUERY"