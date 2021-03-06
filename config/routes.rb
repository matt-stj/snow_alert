Rails.application.routes.draw do

root to: 'home#index'

get '/create_account', to: 'sessions#new'
# post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'

get '/auth/facebook/callback' => 'sessions#create'
get '/auth/facebook', as: 'login'
get '/auth/failure', to: 'home#index'


resources :users, only: [:show, :edit, :update]
resources :mountains, only: [:index, :show]

get '/search', to: 'mountains#search'




end
