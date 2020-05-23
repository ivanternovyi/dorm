require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :admin do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :managers
  devise_for :admins
  devise_for :students

  scope "(:locale)", :locale => /en|ua/ do
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

    resources :rooms, only: %i[index show]

    resources :managers, only: %i[show edit update destroy] do
      resources :posts, only: %i[new edit create update destroy]
    end

    resources :notifications, only: :index do
      collection do
        post :notify
      end
    end

    resources :posts, only: :index
  end
end
