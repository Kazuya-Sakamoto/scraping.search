Rails.application.routes.draw do
  devise_for :users
  namespace :posts do
    resources :searches, only: :index
  end
  root to: 'posts#index'
  resources :posts, only: [:index, :new, :create, :show] do
    resources :comments, only: :create
  end
end
