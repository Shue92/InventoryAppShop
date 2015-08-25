Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  
  
  get 'users/' => "users#index"
  get 'user/edit/:id' => "users#edit"
  get 'user/delete/:id' => "users#destroy"
  
  get 'orders/new/:id' => "products#show"
  
  get 'products/search' => "products#search"
  
  resources :products 
  resources :orders
  resources :users, only: [:show, :update, :deleted]
end
