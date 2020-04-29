Rails.application.routes.draw do
  
  get 'favorites/create'
  get 'favorites/destroy'
  root to: 'toppages#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create, :edit, :update] do
    member do
      get :followings
      get :followers
      get :shares
      get :favorites
    end
  end
  
  resources :musics do
    collection {get "search"}
  end
  
  resources :likes, only: [:new ,:create, :destroy, :show]
  
  resources :shares, only: [:new ,:create, :destroy, :show] do
    resources :comments, only: [:create]
    resources :favorites, only: [:create ,:destroy]
  end
  resources :comments, only: [:destroy]
  
  resources :relationships, only: [:create, :destroy]
end