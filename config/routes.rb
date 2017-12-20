# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "top#index"

  resources :categories, only: %i[index new edit create update destroy]
  resources :tasks
  resources :coins, only: %i[create destroy]

  get "sign_in", to: "session#new", as: "sign_in"
  delete "sign_out", to: "session#destroy", as: "sign_out"

  # Omniauth
  get "auth/:provider/callback", to: "session#create"
  get "auth/failure", to: "session#failure"
end
