Rails.application.routes.draw do

  resources :users

  resources :items

  get '/cart', to: 'orders#cart'
  post '/orders', to: 'orders#create', as: 'new_order'
  post 'checkout', to: 'orders#checkout', as: 'checkout'
  resources :orders
  delete '/orders', to: 'orders#destroy', as: 'remove_item'

  post '/login', to: 'sessions#create', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  root 'items#index'

end
