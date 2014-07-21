Rails.application.routes.draw do
  root 'articles#index'
  
  resources :comments, except: [:new, :edit]
  resources :articles, except: [:new, :edit]
  
end
