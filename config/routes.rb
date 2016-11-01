Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :trips, only: [:index]
  resources :carts, only: [:create]
  get '/cart', to: 'carts#show'
  post '/update_cart', to: 'carts#update'
  get '/:category_name', to: 'categories#show'
end
