ActionController::Routing::Routes.draw do |map|
  map.resources :api_users

  map.resources :magazines
  map.resources :users
  map.root :controller => "main"
end
