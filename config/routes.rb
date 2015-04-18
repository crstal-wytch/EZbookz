Rails.application.routes.draw do
  resources :items

  resources :employees

  resources :companies do 
    collection { post :import }
  end

  devise_for :users
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'
  get 'welcome/books'
  get '/cart' => 'cart#index'
  get '/cart/:id' => 'cart#add'

  resources :invoices
  
  root to: 'welcome#index'
  
end