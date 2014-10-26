$ ->
  $('#recipe_search').typeahead
    name: "recipe"
    remote: "/recipes/autocomplete?query=%QUERY"