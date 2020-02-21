Rails.application.routes.draw do
  devise_for :users
  root 'chats#index'
  resources :users, only: [:edit,:update]
  resources :categories,only: [:new,:create] do
    resources :groups,only:[:index]
  end
  resources :groups,only: [:new,:create] do
    resources :messages,only: [:index,:create]
  end
end
