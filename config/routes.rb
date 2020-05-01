Rails.application.routes.draw do
  # resources :ratings, only: [:create, :destroy]
  resources :post_likes, only: [:create, :destroy]
  resources :post_favorites, only: [:create, :destroy]
  resources :post_dislikes, only: [:create, :destroy]
  resources :comment_likes, only: [:create, :destroy]
  resources :comment_favorites, only: [:create, :destroy]
  resources :comment_dislikes, only: [:create, :destroy]
  resources :reply_likes, only: [:create, :destroy]
  resources :reply_favorites, only: [:create, :destroy]
  resources :reply_dislikes, only: [:create, :destroy]
  
  resources :posts
  resources :comments
  resources :replies
  post '/search', to: 'posts#search'
  get '/trending', to: 'posts#trending'

  namespace :api do
      namespace :v1 do
        resources :users, only: [:create, :show]
        get '/profile', to: 'users#profile'
        get '/favorites', to: 'users#favorite_posts'
        get '/posts', to: 'users#posts'
        get '/likes', to: 'users#likes'
        post '/login', to: 'auth#create'

      end
    end


end
