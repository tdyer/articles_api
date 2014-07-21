Rails.application.routes.draw do
  resources :songs, except: [:new, :edit]
  root 'articles#index'
  
  resources :comments, except: [:new, :edit]
  resources :articles, except: [:new, :edit]
  
end
