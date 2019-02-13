Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :users
  get '/home', to: 'event#index'
end
