Rails.application.routes.draw do
  root 'home#index'
  resources :cards
  
  post "check_translation" => "home#check_translation"
end
