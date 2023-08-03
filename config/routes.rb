  Rails.application.routes.draw do
  
  root 'posts#index'
  get 'sessions/new'
  get '/help', to: 'static_pages#help' 
  get '/about', to: 'static_pages#about' 
  get '/contact', to: 'static_pages#contact' 
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users
  get 'users/new'

  
  resources :posts do
    resources :comments
  end
end
