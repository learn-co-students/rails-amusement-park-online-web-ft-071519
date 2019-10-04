Rails.application.routes.draw do
  root 'application#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :index]

  resources :attractions, only: [:index, :show]
end
