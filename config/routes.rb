Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  get 'users/edit'
  root "homes#top"

  devise_for :users
  resources :dogs, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update, :index]
end
