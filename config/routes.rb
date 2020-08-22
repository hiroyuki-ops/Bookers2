Rails.application.routes.draw do

  root :to => 'books#top'

  devise_for :users
  resources :books

  get '/home/about', to: 'books#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update, :index]

  resources :post_comments, only: [:new, :create, :index, :show]

end