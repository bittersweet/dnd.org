ActionController::Routing::Routes.draw do |map|

  map.root :controller => "tracks", :action => "index"
  
  map.resources :tracks
  map.resources :artists
  map.resources :weblogs
  
  map.resource :user_session
  map.resource :account, :controller => "users"
  map.resources :users
  
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  
  map.namespace :admin do |admin|
    admin.resources :tracks
    admin.resources :artists
    admin.resources :weblogs
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
