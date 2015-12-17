Rails.application.routes.draw do
  get 'user/new'

  root 'home#index'
  resources :cards
  resources :users
  resources :user_sessions

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  
  post "check_translation" => "home#check_translation"
end
