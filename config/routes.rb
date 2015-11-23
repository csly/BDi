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

get '/search', to: 'search#index'


namespace :admin do
     resource :home
    resources :articles
    resources :tracks
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
    resources :styles
    resources :instrumentations
    resources :moods
  end 
 get 'admin' => 'admin/homes#show'
end
