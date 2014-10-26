Cocktail_Central::Application.routes.draw do

  resources :ingredients , only: [:index, :show]

  resources :recipes, except: [:edit, :new] do
  	collection do
  		get :autocomplete
  	end
  end

  get "/search_from_ingredients" => 'recipes#search_from_ingredients', as: 'search_from_ingredients'
  root  'recipes#index'
  match '/about',     to: 'static_pages#about',     via: 'get'
  match '/notfound',  to: 'static_pages#notfound',  via: 'get'
  match '/search',    to: 'static_pages#search',    via: 'get'
  match '/pimp',      to: 'static_pages#pimp',      via: 'get'
  match ':not_found' => redirect('/notfound'), :constraints => { :not_found => /.*/ }, :via => 'get'

end
