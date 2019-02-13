Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :users
  resources :charges
  get '/home', to: 'event#index'
end
