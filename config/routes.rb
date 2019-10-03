Rails.application.routes.draw do
  resources :users, only:[:new, :create, :show]
  resources :attractions, except:[:destroy]
  resources :rides, only:[:create]
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete 'users/logout', to: "sessions#destroy"
  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
