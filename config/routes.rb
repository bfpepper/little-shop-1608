Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'trips#index'

  resources :trips, only: [:index]
  resources :carts, only: [:create]
  resources :users, only: [:new, :index, :create]

  get '/dashboard', to: "users#show"
  get '/cart', to: 'carts#show'

  get '/login', to: "sessions#new"
  delete '/logout', to: "sessions#destroy"
  get '/:category_name', to: 'categories#show'
end
