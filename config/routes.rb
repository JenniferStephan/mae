Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "/simulate_my_rate", to: "pages#simulation", as: "simulate_my_rate"
  get "/test", to: "pages#test", as: "test"


  resources :invoices do
    resources :missions_invoices
  end

  resources :clients, only: [:show, :new, :create, :edit, :update]
  resources :missions, only: [:new, :create]



end
