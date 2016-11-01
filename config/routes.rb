Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :trips, only: [:index]
  resources :categories, only: [:show]
  resources :carts, only: [:create]

  get '/cart', to: 'carts#show'
end
