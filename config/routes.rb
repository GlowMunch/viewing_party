Rails.application.routes.draw do
  resources :viewing_users
  resources :viewing_parties
  resources :movies

  resources :register, controller: "users"

  resources :users, only:[:show, :new, :index, :create] do
    resources :discover, only:[:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_party, only: [:new, :create, :index]
    end
    resources :search, only: [:search]
  end

  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    get 'dashboard', to: 'dashboard#index', as: :dashboard
    # resources :dashboard, only: [:index]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"


  root "welcome#index"
end
