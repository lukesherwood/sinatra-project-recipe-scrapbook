class UsersController < ApplicationController

  get "/users/signup" do
    erb :"/users/signup"
  end

  #for user signup
  post "/users" do

    redirect "/users/:id"
  end

  get "/users/login" do
    erb :'/users/login'
  end

  get "/users/logout" do
    redirect "/login"
  end
  
  #shows all users recipes
  get "/users/:id" do
    erb :"/users/index"
  end

  


end
