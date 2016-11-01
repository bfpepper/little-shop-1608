Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :trips, only: [:index]
  resources :carts, only: [:create]
  get '/cart', to: 'carts#show'
  get '/:category_name', to: 'categories#show'
end
