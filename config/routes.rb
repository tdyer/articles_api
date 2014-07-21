Rails.application.routes.draw do
  resources :playlists, except: [:new, :edit]
  resources :songs, except: [:new, :edit]

  root 'articles#index'

  resources :comments, except: [:new, :edit]
  resources :articles, except: [:new, :edit]

end
