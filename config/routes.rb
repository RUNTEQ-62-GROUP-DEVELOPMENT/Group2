Rails.application.routes.draw do
  resources :users, only: %i[new create]
  resources :mypages, only: %i[index]
  resources :books, only: %i[index create destroy new edit]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  root 'tops#index'
end
