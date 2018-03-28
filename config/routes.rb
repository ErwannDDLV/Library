Rails.application.routes.draw do
  root to: 'pages#home'

  resources :books
  resources :users

  get "users", to: "users#index"

  get "users/new", to: "users#new"
  post "users", to: "users#create"

  # NB: The `show` route needs to be *after* `new` route.
  get "users/:id", to: "users#show"

  get "users/:id/edit", to: "users#edit"
  patch "users/:id", to: "users#update"

  delete "users/:id", to: "users#destroy"




end
