Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'trips#index'

  get '/auth/github/callback', to: 'sessions#create'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
    get '/dashboard/:id', to: 'dashboard#show', as: 'order'
    resources :trips
  end

  resources :trips, only: [:index, :show]
  resources :carts, only: [:create]
  resources :users, except: [:destroy, :show]

  get '/dashboard', to: "users#show"
  get '/cart', to: 'carts#show'

  put '/update_cart', to: 'carts#remove'
  post '/update_cart', to: 'carts#update'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :orders, only: [:new, :create, :index, :show]

  get '/:category_name', to: 'categories#show'

  post '/change_status/:id', to: 'orders#change_status', as: 'change_status'

  get '/admin/change_status_view', to: 'admin/dashboard#change_status'
end
