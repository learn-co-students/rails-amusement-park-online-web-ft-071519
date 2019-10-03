Rails.application.routes.draw do
  root 'application#home'

  get '/users/new', to: 'users#new'
  post'/users', to: 'users#create'
end
