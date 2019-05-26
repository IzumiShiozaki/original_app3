Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#subject'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users

  resources :articles,  only: [:show, :new, :edit, :create, :update, :destroy]
  get  '/subject', to: 'static_pages#subject'
  resources :users do
    member do
      get :gooding
    end
  end
  resources :goods, only: [:create, :destroy]
    # いいねされた数を求める
    resources :articles do
      member do
        get :gooders
      end
    end
end
