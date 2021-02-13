Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users do
      resources :favourites
      resources :conversations
    end
    resources :login, only: [:create]
    resources :register

  end
end
