Rails.application.routes.draw do
  get 'sessions/new'
  root 'tasks#index'

  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
