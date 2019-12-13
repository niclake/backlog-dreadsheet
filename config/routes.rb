Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'games', to: 'games#show'
  get 'books', to: 'books#show'
  get 'about', to: 'about#show'
end
