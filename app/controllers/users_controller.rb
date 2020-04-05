class UsersController < ApplicationController

  get "/users/signup" do
    erb :"/users/signup"
  end

  #for user signup
  post "/users" do
    @user = USER.new(params)
    if @user.save && !@user.email.empty? && !@user.username.empty? && !@user.password.empty?
        session[:user_id] = @user.id
        redirect "/recipes"
        # for when users working correctly redirect "/users/#{@user.id}" 
    else
      redirect "/signup"
    end
  end

  get "/users/login" do
    erb :'/users/login'
  end

  get "/users/logout" do
    redirect "/login"
  end

  #shows all users recipes
  get "/users/:id" do
    @user = USER.all.find(params[:id])
    @recipes = RECIPE.all.collect{|recipe| recipe.USER_id == "#{@user.id}"}
    erb :"/users/index"
  end


end
