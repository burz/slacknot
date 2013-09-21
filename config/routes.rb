Slacknot::Application.routes.draw do
  root to: 'home#index'

  devise_for :users

  resources :users, only: [] do
    get 'graphs', to: 'graphs#index'
    resources :klasses do
      resources :assignments, except: [:index] do
        resources :problems, except: [:index] do
          post 'time'
          get 'test'
        end
      end
    end
  end
end
