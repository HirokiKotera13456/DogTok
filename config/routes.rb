Rails.application.routes.draw do
  root "homes#top"
  devise_for :users
  resources :dogs, only: [:new, :create, :index, :show, :destroy]
end
