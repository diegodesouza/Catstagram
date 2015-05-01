Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  resources :posts, only: [:new, :create]
end
