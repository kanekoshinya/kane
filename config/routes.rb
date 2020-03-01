Rails.application.routes.draw do
  devise_for :users
  root 'chats#index'
  resources :users, only: [:edit,:update]
  resources :categories,only: [:new,:create] do
    resources :groups,only:[:index] 
  end

  resources :groups,only: [:new,:create] do
    resources :favorites, only: [:create,:destroy]
    resources :messages,only: [:index,:create] do
      resources :likes, only: [:create,:destroy]
    end

    namespace :api do
      resources :messages,only: :index,defaults:{format:'json'}
    end
  end
end
