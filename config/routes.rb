ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'overview', :action => 'index'

  map.track_feed '/tracks/feed', :controller => 'tracks', :format => 'rss'
  map.resources :tracks do |t|
    t.download '/download/:id', :controller => 'tracks', :action => 'download'
  end

  map.resources :artists
  map.resources :weblogs

  map.resource  :user_session
  map.resource  :account, :controller => 'users'
  map.resources :users

  map.login    'login',    :controller => 'user_sessions', :action => 'new'
  map.logout   'logout',   :controller => 'user_sessions', :action => 'destroy'

  map.namespace :admin do |admin|
    admin.resources :tracks
    admin.resources :artists
    admin.resources :weblogs
    admin.root :controller => 'overview', :action => 'index'
  end

  map.resources :requiredlistening, :only => 'show'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  Jammit::Routes.draw(map)
end
