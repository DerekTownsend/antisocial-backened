Rails.application.routes.draw do
  resources :ratings
  resources :replies
  resources :comments
  post '/search', to: 'posts#search'
  get '/trending', to: 'posts#trending'
  resources :posts

  namespace :api do
      namespace :v1 do
        resources :users, only: [:create]
        get '/profile', to: 'users#profile'
        get '/favorites', to: 'users#favorite_posts'
        get '/posts', to: 'users#posts'
        get '/likes', to: 'users#likes'
        post '/login', to: 'auth#create'

      end
    end
end
