Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :auth do
        post 'login', to: 'sessions#create'
      end
      resources :users
    end
  end
end
