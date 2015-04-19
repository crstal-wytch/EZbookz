Rails.application.routes.draw do
  get 'carts/show'

  resources :items

  resources :employees

  resources :companies do 
    collection { post :import }
  end

  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'
  get 'welcome/books'
  get 'welcome/checkout'
  get 'welcome/thank_you'
  get '/cart' => 'cart#index'
  get '/cart/:id' => 'cart#add'

  resources :invoices
  
  
  root to: 'welcome#index'
  
end