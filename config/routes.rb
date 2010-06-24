DenachtdienstOrg::Application.routes.draw do |map|
  root :to => 'overview#index'

  resources :tracks do
    member do
      get :download
    end
  end
  resources :artists
  resources :weblogs

  resources :requiredlistening, :as => :requiredlistening, :only => [:index, :show]

  namespace :admin do
    root :to => 'overview#index'
    resources :tracks
    resources :artists
    resources :weblogs
  end

  devise_for :users, :path_names => { :sign_in => 'login',
                                      :sign_out => 'logout',
                                      :sign_up => 'register' }
  Jammit::Routes.draw(map)
end
