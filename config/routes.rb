Rails.application.routes.draw do
  devise_for :managers
  devise_for :admins
  devise_for :students

  root to: 'home#index'

  resources :admins, only: :index do
    collection do
      post :upload_csv
      get :students
      get :managers
      get :posts
    end
  end

  resources :students, only: %i[index show edit update destroy]

  resources :managers, only: %i[show edit update destroy] do
    resources :posts, only: %i[new edit create update destroy]
  end

  resources :notifications, only: :index
end
