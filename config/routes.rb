Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

# error pages
%w( 404 422 500 ).each do |code|
  get code, :to => "errors#show", :code => code
end

root 'homepage#index'

get 'loaderio-e85c09dfa65bcd2736be73c21b6715c4', to: 'loader#index'

resources :articles, path: "news"
resources :artists, path: 'roster'  do
  member do
    get :download
  end
end 
resources :awards
resources :presses, path: 'press' do
  member do
    get :pdfdown
  end
end

resources :releases
resources :videos
resources :abouts, path: "about"
resources :contact, only: [:index] do
  collection do
    post :deliver
  end
end   
resources :composers
resources :songwriters
resources :producers
resources :roster, path: 'artists'
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
  resources :videos
  resources :abouts    
  resources :users
  resources :genres  
  resources :formats   
  resources :staffs
  resources :types
  resources :productions  
  resources :styles
  resources :instrumentations
  resources :moods
end 
 get 'admin' => 'admin/homes#show'
end
