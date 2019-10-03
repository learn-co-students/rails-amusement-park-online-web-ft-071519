Rails.application.routes.draw do
  root 'application#home'

  get '/signin', to: 'sessions#new'

  resources :users, only: [:new, :create, :show, :index]
end
