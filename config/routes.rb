Slacknot::Application.routes.draw do
  resources :problems

  root to: 'home#index'

  devise_for :users

  resources :users, only: [] do
    resources :klasses do
      resources :assignments
    end
  end
end
