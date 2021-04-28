Rails.application.routes.draw do
  devise_for :users

  root to: 'home#top'

  get 'home/about', to: 'home#about', as: 'about_home'
  # get 'homes/about' => 'homes#about', as: 'about_home'

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  resources :users, only: [:show, :index, :edit, :update]
end
