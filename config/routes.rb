ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'overview', :action => 'index'

  map.track_feed '/tracks/feed', :controller => 'tracks', :format => 'rss'
  map.resources :tracks do |t|
    t.download '/download/:id', :controller => 'tracks', :action => 'download'
  end

  map.resources :artists
  map.resources :weblogs

  map.namespace :admin do |admin|
    admin.resources :tracks
    admin.resources :artists
    admin.resources :weblogs
    admin.root :controller => 'overview', :action => 'index'
  end

  map.resources :requiredlistening, :only => ['index', 'show']

  map.devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register'}

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  Jammit::Routes.draw(map)
end
