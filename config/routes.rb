Rails.application.routes.draw do
  devise_for :admins
  devise_for :students

  root to: "home#index"

  resources :admins, only: :index
end
