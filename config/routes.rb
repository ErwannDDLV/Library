Rails.application.routes.draw do
  root to: 'pages#home'

  resources :books

  get "users", to: "users#index"
  
  get "users/:id", to: "users#show", as: :user

  delete "users/:id", to: "users#destroy"
end
