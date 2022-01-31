Rails.application.routes.draw do
  devise_for :users
  resources :books

   root to: 'homes#top'

 get 'home/about'=> 'homes#about'
 get 'books'=> 'books#index'



resources :users, only: [:index, :show, :edit, :update ]

 end
