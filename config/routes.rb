Rails.application.routes.draw do
  devise_for :admins
  devise_for :students

  root to: "home#index"

  resources :admins, only: :index do
    collection do
      post :upload_csv
    end
  end

  resources :students
end
