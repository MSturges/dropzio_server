Rails.application.routes.draw do

  resources :users
  resources :posts
  resources :uploads

  post '/login', to: "logins#login"
  get '/postlist', to: "posts#getposts"

  post '/changescore', to: "posts#changescore"



end
