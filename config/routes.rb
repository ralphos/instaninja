Instaninja::Application.routes.draw do
  get '/home', to: redirect('/')
  root :to => 'high_voltage/pages#show', id: 'home'

  get '/auth/instagram', as: :authenticate_instagram
  get '/auth/instagram/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :sign_out

  delete '/hashtag/:id', to: 'hashtags#destroy', as: :destroy_hashtag

  resources :hashtags, only: [:index, :create]
  resources :users, only: [:update]
  resources :likes, only: [:create]
end
