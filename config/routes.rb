Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

root 'homepage#index'

#resources :admin
resources :articles 
resources :artists do
  member do
    get :download
  end
end 
resources :awards
resources :presses
resources :releases
resources :abouts
resources :contact
resources :composers
resources :songwriters
resources :tweets

require 'sidekiq/web'
require 'sidetiq/web'
mount Sidekiq::Web => '/sidekiq'

get '/search', to: 'search#index'


namespace :admin do
     resource :home
    resources :articles do
      member do
        put :publish
      end
    end
    resources :tracks
    resources :artists
    resources :awards
    resources :audios
    resources :presses
    resources :releases
    resources :abouts    
    resources :users
    resources :genres    
    resources :staffs
    resources :types
    resources :productions  
    resources :styles
    resources :instrumentations
    resources :moods
  end 
 get 'admin' => 'admin/homes#show'
end
