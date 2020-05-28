Rails.application.routes.draw do
  # ログイン
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
 # サインアップ
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]
  # タスク管理
  root to: 'tasks#index'
  resources :tasks
end
