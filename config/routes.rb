ActionController::Routing::Routes.draw do |map|
  map.resources :magazines
  map.resources :users
  map.root :controller => "main"
end
