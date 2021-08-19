Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users

      resources :courses do 
        resources :topics
      end

      resources :topics do 
        resources :videos
      end
    end
  end

  # root "courses#index"
  # get "/about", to: "static#about"
  # get "/settings", to: "static#settings"

  # get "/login", to: "sessions#new"
  # post "/login", to: "sessions#create"
  # get "logout", to: "sessions#destroy"

  # resources :users, only: [:show, :new, :create, :edit, :update, :destroy]

  # resources :courses, only: [:index, :show] do 
  #   resources :topics, only: [:index, :show]
  # end

  # resources :topics, only: [:index, :show] do 
  #   resources :videos, only: [:index, :show]
  # end

  get '*path', to: "courses#index", via: :all
end
