Rails.application.routes.draw do
  root to: 'offers#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'users/new'

  resources :offers
end
