Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :auth do
        post 'login', to: 'user_sessions#create'
        post 'admin_login', to: 'admin_sessions#create'
      end
      resources :users
      resources :tasks
      resources :admins
    end
  end
end
