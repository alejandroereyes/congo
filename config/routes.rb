Rails.application.routes.draw do

  resources :users

  resources :items

  resources :orders

  post '/login', to: 'sessions#create', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  root 'items#index'

end
