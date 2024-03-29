Instaninja::Application.routes.draw do
  root :to => 'pages#show', id: 'home'

  get '/auth/instagram', as: :authenticate_instagram
  get '/auth/instagram/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :sign_out

  delete '/hashtags/:id', to: 'hashtags#destroy', as: :destroy_hashtag, via: :delete

  resources :hashtags, only: [:index, :create]
  resources :users, only: [:update]
  resources :user_commenters, only: [:index, :create, :destroy]
  resources :user_likes, only: [:index, :create, :destroy]
  resources :likes, only: [:create]
end
