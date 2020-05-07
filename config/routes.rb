Rails.application.routes.draw do

  root to: 'toppages#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :likes, only: [:new ,:create, :destroy, :show]
  resources :comments, only: [:destroy]
  resources :relationships, only: [:create, :destroy]
  
  resources :shares, only: [:new ,:create, :destroy, :show] do
    resources :comments, only: [:create]
    resources :favorites, only: [:create ,:destroy]
  end
  
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
  
  post '/shares/:share_id/favorites' => "favorites#create"
  delete '/shares/:share_id/favorites' => "favorites#destroy"
 
end