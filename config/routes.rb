Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :farmers do
    resources :pigs, except: [:show]
    resources :rentals, only: [:index]
  end

  resources :pigs, only: [:index, :show] do
    resources :rentals, only: [:new, :create]
  end

  resources :rentals, only: [:index, :edit, :update]
end
