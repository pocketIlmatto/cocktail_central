Cocktail_Central::Application.routes.draw do

  resources :ingredients , only: [:index, :show]

  resources :recipes

  root  'static_pages#home'
  match '/help',      to: 'static_pages#help',      via: 'get'
  match '/about',     to: 'static_pages#about',     via: 'get'
  match '/notfound',  to: 'static_pages#notfound',  via: 'get'
  match '/search',    to: 'static_pages#search',    via: 'get'
  match '/pimp',      to: 'static_pages#pimp',      via: 'get'
  match ':not_found' => redirect('/notfound'), :constraints => { :not_found => /.*/ }, :via => 'get'

end
