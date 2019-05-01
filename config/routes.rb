Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to:'static_pages#help'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  get '/japanese', to:'users#japanese'
  get '/socialstudies', to:'users#socialstudies'
  get '/math', to:'users#math'
  get '/science', to: 'users#science'
  get '/english', to: 'users#english'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users
end
