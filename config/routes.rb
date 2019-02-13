Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show]
  resources :events, only: [:index, :show, :new]
  resources :charges

  root 'events#index'
  
end
