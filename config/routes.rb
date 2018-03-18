Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  delete '/logout',  to: 'sessions#destroy'
  get '/upload', to: 'static_pages#upload'
  get '/microposts', to: 'static_pages#home'
  get '/recipes', to: 'recipes#index'

  resources :users
  resources :microposts,          only: [:create, :destroy]
  resources :recipes, only: %w(show index)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
