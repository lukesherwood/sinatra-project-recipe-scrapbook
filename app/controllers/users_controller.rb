class UsersController < ApplicationController

  get "/signup" do
    if !logged_in?
      erb :'/users/signup'
  else 
      redirect to '/recipes'
  end
  end

  #for user signup
  post "/users" do
    @user = USER.new(params)
    if @user.save && !@user.email.empty? && !@user.username.empty? && !@user.password.empty?
        session[:user_id] = @user.id
        redirect "/recipes"
        # for when login working correctly redirect "/users/#{@user.id}" 
    else
      redirect "/signup"
    end
  end

  get "/login" do
    if !logged_in?
      erb :'/users/login'
    else
      redirect "/recipes"
    end
  end

  post '/login' do
    @user = USER.find_by(:username => params[:username]) 
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect to '/recipes'
    else
        erb :'/users/login'
    end
end

  get "/logout" do
    session.clear if logged_in? 
    redirect '/login'
  end

  get "/users/:id" do
    @user = USER.all.find(params[:id])
    erb :"/users/homepage"
  end

  #shows all users recipes
  get "/users/:id/recipes" do
    @user = USER.all.find(params[:id])
    @recipes = @user.RECIPES
    erb :"/users/recipes"
  end

  


end
