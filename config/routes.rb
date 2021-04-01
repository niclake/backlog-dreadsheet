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
      get 'complete_abandoned'
      get 'unowned'
      get 'games_to_play'
      get 'pc_games'
      get 'switch_games'
      get 'ps4_games'
    end
  end
  resources :books
end
