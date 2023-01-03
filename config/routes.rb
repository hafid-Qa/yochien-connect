Rails.application.routes.draw do
  # get 'children/create'
  # get 'children/index'
  # get 'children/update'
  # get 'children/cancel_transport'
  resources :children, only: [:create, :update, :index] do
      member do
        resources :trips, only: [ :update]
      end
  end
  devise_for :users
  root to: "pages#home"

  
    # API routing
    namespace :api, defaults: { format: :json } do
      namespace :v1 do
        resources :child_in_trips, only: [:update] do
        end
      end
    end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    # API routing

end
