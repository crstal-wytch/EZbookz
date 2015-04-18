Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'
  get 'welcome/books'

  resources :invoices
  
  root to: 'welcome#index'
  
end