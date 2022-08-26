Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homepage#home"

  # get "/home", to: "homepage#home"
  get "/login", to: "homepage#login"
  get "/signin", to: "homepage#signin"

end
