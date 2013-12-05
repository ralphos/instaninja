Instaninja::Application.routes.draw do
  #get '/home', to: redirect('/')
  root :to => 'pages#show', id: 'home'

  get '/auth/instagram', as: :authenticate_instagram
  get '/auth/instagram/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :sign_out
  get '/users', to: 'user_likes#index', as: :user_likes
  get '/commenters', to: 'user_commenters#index', as: :user_commenters

  delete '/hashtags/:id', to: 'hashtags#destroy', as: :destroy_hashtag, via: :delete

  resources :hashtags, only: [:index, :create]
  resources :users, only: [:update]
  resources :user_commenters, only: [:create, :destroy]
  resources :user_likes, only: [:create, :destroy]
  resources :likes, only: [:create]
end
