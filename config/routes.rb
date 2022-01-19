Rails.application.routes.draw do
  resources :users
  root 'articles#index'
  get 'pages/about'
  get 'pages/contact'
  resources :categories
  get 'articles', to: 'articles#index'
  post 'articles', to: 'articles#create'
  get 'articles/new', to: 'articles#new', as: 'new_article'
  get 'articles/:id/edit', to: 'articles#edit', as: 'edit_article'
  get 'articles/:id', to: 'articles#show', as: 'article'
  put 'articles/:id', to: 'articles#update'
  patch 'articles/:id', to: 'articles#update'
  delete 'articles/:id', to: 'articles#destroy'

  get 'signup', 		to: 'users#new'
  get 'login',  		to: 'sessions#new'
  post 'login', 		to: 'sessions#create'
  delete 'logout',	to: 'sessions#destroy'
end
