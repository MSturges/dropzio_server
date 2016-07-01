Rails.application.routes.draw do
  resources :users
  resources :posts

  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#destroy"


end
