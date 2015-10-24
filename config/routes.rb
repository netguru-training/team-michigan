Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'visitors#index'

  resources :events

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

end
