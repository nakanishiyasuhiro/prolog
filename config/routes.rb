Rails.application.routes.draw do
  root to: "tops#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
  } 
  resources :programminglogs do
    resources :likes, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end
  resources :users, except: [:new]
end

