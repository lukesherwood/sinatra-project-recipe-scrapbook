class UsersController < ApplicationController

  get "/signup" do
    already_logged_in_redirect
    erb :'/users/signup'
  end

  #for user signup
  post "/users" do
    @user = User.new(params)
    if @user.save
        session[:user_id] = @user.id
        redirect "/"
    else
      @errors = @user.errors.full_messages
      erb :'/users/signup'
    end
  end

  get "/login" do
    already_logged_in_redirect
    erb :'/users/login'
  end

  #for user login
  post '/login' do
    @user = User.find_by(:username => params[:username]) 
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
    else
      @errors = "Invalid username or password."
        erb :'/users/login'
    end
end

  get "/logout" do
    session.clear if logged_in? 
    redirect '/'
  end

  #user homepage/index
  get "/users/:id" do
    not_logged_in_redirect
    @user = User.all.find(params[:id])
    @recipes = @user.recipes
    erb :"/users/index"
  end

end
