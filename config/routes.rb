Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index]
  resources :events, only: [:index, :show, :new]

  get '/home', to: 'event#index'
end
