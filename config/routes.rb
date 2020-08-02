# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'home#index'
  resources :profiles, only: %i[new show edit create update]
  resources :posts, only: %i[new show edit create]
  resources :random_hikes, only: %i[index]
  get :search, to: 'random_hikes#search'
end
