Rails.application.routes.draw do
  
  root "static#home"
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]

  resources :courses, only: [:index, :show] do 
    resources :topics, only: [:index, :show]
  end

  resources :topics, only: [:index, :show] do 
    resources :videos, only: [:index, :show]
  end

end
