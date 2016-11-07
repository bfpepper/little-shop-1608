Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'trips#index'

  get '/auth/github/callback', to: 'sessions#create'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
    get '/dashboard/:id', to: 'dashboard#show', as: 'order'

    resources :trips, only: [:index, :create, :new, :edit, :update]
  end

  resources :trips, only: [:index, :show]
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

  # get '/trips/:title', to: 'trips#show', as: 'trip'
  # post '/trips/:title', to: 'trips#show'

  post '/change_status/:id', to: 'orders#change_status', as: 'change_status'

end
