Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

# error pages
%w( 404 422 500 503 ).each do |code|
  get code, :to => "errors#show", :code => code
end

root 'homepage#index'

resources :articles, path: "news"
resources :artists do
  member do
    get :download
  end
end 
resources :awards
resources :presses, path: "press"
resources :releases
resources :abouts, path: "about"
resources :contact
resources :composers
resources :songwriters
resources :producers
resources :roster
resources :tweets
resources :privacy
resources :b_di_productions, path: "bdiproductions"

require 'sidekiq/web'
require 'sidetiq/web'
mount Sidekiq::Web => '/sidekiq'

get '/search', to: 'search#index'


namespace :admin do
  resource :home
  resources :articles
  resources :tracks do
    collection do
      get :unassigned
    end
  end
  resources :b_di_productions
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
