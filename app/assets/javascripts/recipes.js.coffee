ingredientList = [];



moveIngredient = (direction, id, displayName) ->
    #Direction: 1 Adding to selected ingredients, 0 Removing from selected ingredients
    if direction is 1
      ingredientList[ingredientList.length] = displayName;
      $("#ingredient-"+id).data('direction', 0);
      $("#selected_ingredients").append($("#ingredient"+id));
      $("#glyph-"+id).addClass("glyphicon-remove-circle icon-red").removeClass("glyphicon-ok-circle icon-blue");
    else
      ingredientList.splice(ingredientList.indexOf(displayName),1);
      $("#ingredient-"+id).data('direction', 1);
      $("#popular_ingredients").append($("#ingredient"+id));
      $("#glyph-"+id).addClass("glyphicon-ok-circle icon-blue").removeClass("glyphicon-remove-circle icon-red");
    
    $.ajax 'search_from_ingredients',
        type: 'GET'
        data: { 'ingredient_list' : ingredientList} 
        

$ ->
  $("a[data-direction]").click (e) ->
    moveDirection = $(this).data("direction")
    ingredientId = $(this).data("ingredient-id")
    ingredientName = $(this).data("display-name")
    moveIngredient(moveDirection, ingredientId, ingredientName)
  
$ ->
  $('#recipe_search').typeahead
    name: "recipe"
    remote: "/recipes/autocomplete?query=%QUERY"