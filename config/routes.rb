Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :simulations
  get "/discover", to: "pages#discover", as: "landing_page"

  get 'invoice_paid/:id', to: 'invoices#invoice_paid', as: 'invoice_paid'

  resources :invoices do
    member do
      post :send_to_client
    end

    resources :missions_invoices
  end

  resources :clients, only: [:show, :new, :create, :edit, :update]
  resources :missions, only: [:new, :create]
  resources :notifications, only: [:show, :index, :new, :create]

end
