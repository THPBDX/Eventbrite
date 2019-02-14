Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show]
  resources :events, only: [:index, :show, :new]
  resources :charges
  resources :events do resources :attendances, only: [:new, :create, :index]
  end

  root 'events#index'

end
