Rails.application.routes.draw do
  
  get 'microposts/create'
  get 'microposts/destroy'
  get 'relationships/create'
  get 'relationships/destroy'
  root to: 'toppages#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create, :edit] do
    member do
      get :followings
      get :followers
    end
  end
  
  resources :likes, only: [:new ,:create, :destroy, :show]
  
  resources :shares, only: [:new ,:create, :destroy, :show] do
    resources :comments, only: [:create ,:destroy]
  end
  
  resources :relationships, only: [:create, :destroy]
end