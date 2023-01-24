Rails.application.routes.draw do
  root 'tasks#index'
  get 'search' => 'tasks#search'

  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :destroy]

  namespace :admin do
    resources :users
  end
end
