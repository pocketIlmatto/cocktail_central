== Cocktail Central

Online database of cocktail recipies In the background, there are 3 different search options for finding recipes or ingredients based on a list of ingredients:

<ol>
<li>Search for all recipes that include a certain ingredient or ingredients <-- This search isn't currently exposed to the UI</li>
<li>Search for only recipes that can be made given an ingredient list. <-- This search is in use on the home page currently. </li>
<li>Pimp my bar! - search for new ingredients to add to your bar in order to maximize the number of different drinks you can make! <-- This search can be found at /pimp and is not currently exposed on the home page</li>
</ol>


To configure for development, run
`brew install elasticsearch`
(or whatever you use for package management)
`bundle install`
`rake db:create; rake db:migrate; rake db:seed;`

Note: Install and run elasticsearch locally.  Add/update index on the Recipe model. Check out the documentation for the
<a href="https://github.com/ankane/searchkick">searchkick gem</a>

Adding new or editing recipes is not currently available - the database is seeded with >1000 recipes from various JSON files from the<a href="https://github.com/shuw/cocktail_shaker">cocktail_shaker</a> repo and the <a href="https://github.com/daveturnbull/shake_strain">shake_strain</a> repo.

Future work:
<ul>
<li>Front end work to create/update recipes, including ingredients</li>
<li>Add ingredient search box to the Ingredients picker</li>
<li>Auto add more suggested ingredients to the Ingredients picker</li>
<li>Categorization - recipes and ingredients</li>
<li>Expose Pimp my Bar! results on the Ingredients picker</li>
<li>Research and improve use of searchkick/Elasticsearch</li>
<li>ReactJS for homepage components</li>
<li>Caching strategy</li>
<li>Writing tests</li>
<li>Yumly API integration for more recipes</li>
<li>User accounts using Devise</li>
<li>User persistent inventory</li>
<li>User contributed recipes and ingredients - and recipes/ingredients are only editable by admin user or user who created</li>
<li>User reviews of recipes, and ranking Pimp my bar by user ranking</li>
<li>Crowdsourced database scrubbing - users can flag recipes as duplicates, misspelling, wrong</li>
<li>Cocktail party! - Collaborate with your friends to make new recipes.  Social connections.  Geo-located suggestions..meet new friends!?</li>
<li>Processes/Recipe instructions along with tools needed (like Routes in a manufacturing application)</li>
</ul>

