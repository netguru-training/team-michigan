Rails.application.routes.draw do
  get 'requests/create'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'visitors#index'

  resources :events

  resources :requests, only: :create

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

end
