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

  root "static#home"
  get '*path', to: "static#home", via: :all
end
