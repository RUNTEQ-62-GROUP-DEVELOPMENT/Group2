Rails.application.routes.draw do
  resources :users, only: %i[new create edit update destroy]
  resources :mypages, only: %i[index]
  resources :goals
  resources :books
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  root 'tops#index'
end
