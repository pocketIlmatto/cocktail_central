== Cocktail Central

Online database of cocktail recipies with three different search options:

<ol>
<li>Search for all recipes that include a certain ingredient or ingredients</li>
<li>Search for only recipes that can be made given an ingredient list</li>
<li>Pimp my bar! - search for new ingredients to add to your bar in order to maximize the number of different drinks you can make!</li>
</ol>


To configure for development, run
`rake db:create; rake db:migrate; rake db:seed;`

Adding new or editing recipes is not currently available - the database is seeded with >1000 recipes from various JSON files from the<a href="https://github.com/shuw/cocktail_shaker">cocktail_shaker</a> repo and the <a href="https://github.com/daveturnbull/shake_strain">shake_strain</a> repo.

Future work:
<ul>
<li>Front end work to create/update recipes, including ingredients</li>
<li>Ingredient search should suggest/auto-fill based on data in database</li>
<li>Basic recipe search by recipe name with auto-suggestion</li>
<li>Categorization - recipes and ingredients</li>
<li>Enhanced Pimp my Bar! results back end - return the collection ranked by (and including) # new recipes that can be fulfilled by a single ingredient</li>
<li>Enhanced Pimp my Bar! results front end - Split out the results into two sections: 1. "Go buy/steal/borrow these right now!"" (new ingredients that would produce >= 2 more drinks), 2. "Maybe later" (new ingredients that would produce 1 more drink)</li>
<li>Research faster algorithms for searches</li>
<li>Caching strategy</li>
<li>Writing tests</li>
<li>Yumly API integration for more recipes</li>
<li>User accounts using Devise</li>
<li>User persistent inventory</li>
<li>User contributed recipes and ingredients - and recipes/ingredients are only editable by admin user or user who created</li>
<li>User reviews of recipes, and ranking Pimp my bar by user ranking</li>
<li>Crowdsourced database scrubbing - users can flag recipes as duplicates, misspelling, wrong</li>
<li>Cocktail party! - Collaborate with your friends to make new recipes</li>
<li>Processes/Recipe instructions along with tools needed (like Routes in a manufacturing application)</li>
</ul>

