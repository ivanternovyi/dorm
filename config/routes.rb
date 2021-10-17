# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :admin do
    mount Sidekiq::Web => '/sidekiq'
  end

  mount ActionCable.server => '/cable'

  devise_for :managers
  devise_for :admins
  devise_for :students

  scope '(:locale)', locale: /en|ua/ do
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

    resources :notifications, only: :index do
      collection do
        post :notify
      end
    end

    resources :posts, only: :index

    resources :rooms do
      resources :claims, only: %i[index create] do
        member do
          post :mark_in_progress
          post :approve
          post :reject
        end
      end
    end

    resources :chats, only: :index
  end
end
