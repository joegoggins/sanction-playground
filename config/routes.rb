ActionController::Routing::Routes.draw do |map|
  map.resources :magazines

  map.resources :users

  map.root :controller => "main"


  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
