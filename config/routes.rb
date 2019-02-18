Rails.application.routes.draw do
  # get 'auth/callback'
  # get 'auth/failure'
  # get 'dashboard/show'
  # get 'public_pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # home page
  root 'public_pages#home'
  get '/' => 'auth#new'
  # Dashboard
  get 'dashboard' => 'dashboard#show'
  get   '/login', :to => 'sessions#new', :as => :login
  match '/auth/:provider/callback', :to => 'auth#callback', :via => [:get, :post]
  match '/auth/failure', :to => 'auth#failure', :via => [:get, :post]
  get '/logout', :to => 'auth#destroy'
end
