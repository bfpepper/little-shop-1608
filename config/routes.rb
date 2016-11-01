Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'trips#index'

  resources :trips, only: [:index]
  resources :categories, only: [:show]
  resources :carts, only: [:create]
  resources :users, only: [:new]

  get '/cart', to: 'carts#show'

  get '/login', to: "sessions#new"
end
