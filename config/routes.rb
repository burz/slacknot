Slacknot::Application.routes.draw do
  resources :klasses

  devise_for :users

  root to: 'home#index'

  resources :users, only: [] do
    resources :klasses
  end
end
