Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks do
    member do
      patch :toggle
    end
  end
end
