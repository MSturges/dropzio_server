Rails.application.routes.draw do

  match '*any' => 'application#options', :via => [:options]

  resources :users
  resources :posts
  resources :uploads

  post '/login', to: "logins#login"

  get '/postlist', to: "posts#getposts"

  post '/changescore', to: "posts#changescore"

  get '/geofilteredposts/:id', to: "posts#geoFilteredPosts"

  post '/compass/:id', to: "posts#compass"



end
