Rails.application.routes.draw do

  root 'sessions#welcome'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout route
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  #omniauth callback
  get '/auth/:google_oauth2/callback' => 'sessions#google'

  resources :topics
  resources :lists
  resources :users

  resources :users do
    resources :lists, only: [:show, :index]
  end
  resources :topics do
    resources :lists, only: [:index, :new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
