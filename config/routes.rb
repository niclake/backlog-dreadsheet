Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'about', to: 'home#about'
  resources(
    :games,
    except: %i[show]
  ) do
    collection do
      get 'in_progress_priority'
    end
  end
  resources :books
end
