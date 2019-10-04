Rails.application.routes.draw do
  get 'ride/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  resources :users, only: [:new, :create, :show, :update]
  resources :attractions
  resources :rides, only: [:create]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
