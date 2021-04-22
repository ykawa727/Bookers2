Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'

  get 'homes/about', to: 'homes#about', as: 'about_home'
  # get 'homes/about' => 'homes#about', as: 'about_home'

  resources :books, only: [:new, :create, :index, :show, :destroy]

  resources :users, only: [:show, :index]
end
