Rails.application.routes.draw do
  devise_for :users

root 'homepage#index'

#resources :admin
resources :clients
resources :articles 
resources :artists 
resources :awards
resources :presses
resources :releases
resources :abouts


namespace :admin do
     resource :home
    resources :articles
    resources :artists
    resources :awards
    resources :presses
    resources :releases
    resources :abouts    
    resources :users
    resources :genres    
    resources :staffs
    resources :types
    resources :productions  
  end 
 get 'admin' => 'admin/homes#show'
end
