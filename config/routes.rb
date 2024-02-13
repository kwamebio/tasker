Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :auth do
        post 'login', to: 'sessions#create'
      end
      resources :users
      resources :tasks
    end
  end
end
