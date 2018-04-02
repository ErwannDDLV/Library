Rails.application.routes.draw do
  root to: 'pages#home'

  resources :users, :books
  resources :reservations, except: :destroy
  delete 'reservations', to: 'reservations#destroy'

end
