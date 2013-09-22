Slacknot::Application.routes.draw do
  root to: 'home#index'

  devise_for :users

  resources :users, only: [] do
    resources :klasses do
      resources :assignments, except: [:index] do
        resources :problems, except: [:index] do
          post 'time'
          get 'view'
        end
        get 'build'
      end
    end

    get 'pipeline', to: 'users#pipeline'
    get 'graphs', to: 'graphs#index'
    get 'time_per_class', to: 'graphs#time_per_class'
    get 'average_problem_time_per_class', to: 'graphs#average_problem_time_per_class'
    get 'average_time_per_assignment', to: 'graphs#average_time_per_assignment'
    get 'average_time_per_day_of_week', to: 'graphs#average_time_per_day_of_week'
  end
end
