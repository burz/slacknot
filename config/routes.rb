Slacknot::Application.routes.draw do
  root to: 'home#index'

  devise_for :users

  resources :users, only: [] do
    resources :klasses do
      resources :assignments, except: [:index] do
        resources :problems, except: [:index]
      end
    end
  end
end
