Rails.application.routes.draw do

  root to: 'visitors#index'

  post 'requests' => 'requests#create'
<<<<<<< Updated upstream
  put 'requests' => 'requests#update'
=======
  delete 'requests' => 'requests#destroy'
>>>>>>> Stashed changes

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  resources :events
  resources :evaluations, only: [:create, :new]

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  get 'myevents' => 'visitors#my_events'

end
