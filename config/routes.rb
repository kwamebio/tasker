Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :auth do
        post 'login', to: 'user_sessions#create'
        post 'admin_login', to: 'admin_sessions#create'
      end
      resources :users
      resources :tasks do
        collection do
          patch 'assign'
        end
      end
      resources :admins
      resources :notifications do
        collection do
          patch 'mark_as_read'
          patch 'mark_all_as_read'
        end
      end
      resources :projects
    end
  end
end
