Rails.application.routes.draw do
  root to: "tops#index"
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  resources :programminglogs do
    resources :likes, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end
  resources :users, only: [:show, :create, :edit, :update, :destroy]
end

