Rails.application.routes.draw do
  root 'cars#index'

  get 'cars/search', to: 'cars#search'
  get 'cars/search', to: 'cars#index'
  resources :cars

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
