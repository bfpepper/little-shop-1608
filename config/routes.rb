Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'trips#index'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
    resources :trips, only: [:create, :new]
  end

  resources :trips, only: [:index]
  resources :carts, only: [:create]
  resources :users, only: [:new, :index, :create, :edit, :update]

  get '/dashboard', to: "users#show"
  get '/cart', to: 'carts#show'

  put '/update_cart', to: 'carts#remove'
  post '/update_cart', to: 'carts#update'


  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :orders, only: [:new, :create, :index, :show]

  get '/:category_name', to: 'categories#show'

  get '/trips/:title', to: 'trips#show', as: 'trip'
  post '/trips/:title', to: 'trips#show'

end
