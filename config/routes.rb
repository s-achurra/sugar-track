Rails.application.routes.draw do
  resources :posts

  get 'search/posts', to: 'posts#search', as: :search_posts

  devise_for :users
  root to: 'posts#index'
end
