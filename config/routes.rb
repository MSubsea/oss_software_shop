Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :softwares do
    resources :releases, only: [ :new, :create ]
  end
  resources :releases, only: [ :edit, :update, :destroy ] do
    resources :reviews, only: [ :new, :create ]
  end
  resources :users, only: [ :index, :edit, :update, :destroy ]
  resources :customers

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
