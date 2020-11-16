Rails.application.routes.draw do
  devise_scope :user do
    get 'users/sign_out', to: "devise/sessions#destroy", as: "logout"
  end

  devise_for :users

  resources :users
  resources :notifications

  root to: "users#index"
end
