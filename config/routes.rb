Rails.application.routes.draw do
  root to: "tops#index"
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :programminglogs, only: [:index, :new, :create, :show]
end
