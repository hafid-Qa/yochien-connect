Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  get 'user/:id', to: 'users#show', as: 'user'
  resources :children, only: [:create, :update, :index] 
  resources :chatrooms, only: [:show, :index, :create] do
    resources :messages, only: :create
  end
  
    # API routing
    namespace :api, defaults: { format: :json } do
      namespace :v1 do
        resources :trips, only: [:update] do
        end
      end
    end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    # API routing

end
