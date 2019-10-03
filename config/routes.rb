Rails.application.routes.draw do
  root 'application#home'

  resources :users, only: [:new, :create, :show, :index]
end
