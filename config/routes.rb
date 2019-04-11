Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get "sessions/new"
  root "static_pages#home"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :locations
  resources :comments
  resources :tours do
    resources :locations, only: :index
  end
  resources :orders
  namespace :admin do
    root "static_pages#index"
    resources :users
    resources :hotels
    resources :tours
    resources :locations
    resources :sales
    resources :comments, only: %i(index destroy)
    resources :orders, except: :create
  end
end
