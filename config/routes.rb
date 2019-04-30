Rails.application.routes.draw do
  get 'subjects/japanese'

  get 'subjects/socialstudies'

  get 'subjects/math'

  get 'subjects/science'

  get 'subjects/english'

  get 'users/new'

  root 'static_pages#home'
  get '/help', to:'static_pages#help'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  get '/japanese', to:'users#japanese'
  get '/socialstudies', to:'users#socialstudies'
  get '/math', to:'users#math'
  get '/science', to: 'users#science'
  get '/english', to: 'users#english'
end
