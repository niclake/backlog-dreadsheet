Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'about', to: 'home#about'
  resources :games
  resources :books
  #get 'games', to: 'games#index'
  #get 'books', to: 'books#index'
end
