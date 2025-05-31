Rails.application.routes.draw do
  resources :posts
  root "tasks#index"
  resources :tasks do
    member do
      patch :toggle
    end
  end
end
