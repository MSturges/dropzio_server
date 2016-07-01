Rails.application.routes.draw do

  resources :users
  resources :posts
  resources :uploads

  post '/login', to: "logins#login"

end
