Rails.application.routes.draw do

  get 'searches/index'

  resources :users, only: [:new, :create, :show]
  resources :searches

  root 'searches#index'
  get '/signup' => "users#new", as: :signup
  get '/login'  => "sessions#new", as: :login
  post '/login' => "sessions#create", as: :login_create
  get '/logout' => "sessions#destroy", as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
