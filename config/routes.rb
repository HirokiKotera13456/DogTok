Rails.application.routes.draw do
  get 'maps/index'
  resources :maps, only: [:index]
  get 'search/search'
  get 'homes/about'
  root "homes#top"
  get '/search' => 'search#search'
  devise_for :users
  
  resources :dogs, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :reviews, only: [:index, :create]
    resource :favorites, only: [:create, :destroy]
    resources :dog_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update, :index] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    
  end
  resources :messages, only: [:create,:destroy]
  resources :rooms, only: [:create,:show]
  
  
end
