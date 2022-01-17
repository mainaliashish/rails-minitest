Rails.application.routes.draw do
  resources :users
  root 'pages#index'
  get 'pages/about'
  get 'pages/contact'
  # resources :articles
  get 'articles', to: 'articles#index'
  post 'articles', to: 'articles#create'
  get 'articles/new', to: 'articles#new', as: 'new_article'
  get 'articles/:id/edit', to: 'articles#edit', as: 'edit_article'
  get 'articles/:id', to: 'articles#show', as: 'article'
  put 'articles/:id', to: 'articles#update'
  patch 'articles/:id', to: 'articles#update'
  delete 'articles/:id', to: 'articles#destroy'
end
