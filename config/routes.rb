Rails.application.routes.draw do
  root to: 'pages#home'

  resources :books
  resources :users
end
