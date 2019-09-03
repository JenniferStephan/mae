Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :simulations
  get "/discover", to: "pages#discover", as: "landing_page"

  get 'invoice_paid/:id', to: 'invoices#invoice_paid', as: 'invoice_paid'
  get 'invoice_sent/:id', to: 'invoices#invoice_sent', as: 'invoice_sent'

  resources :invoices do
    resources :missions_invoices
  end

  resources :clients, only: [:show, :new, :create, :edit, :update]
  resources :missions, only: [:new, :create]



end
