require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
		set :session_secret, "recipe_password"
  end

  get "/" do
    @recipes = Recipe.all
    erb :index
  end

  helpers do
    
    def not_logged_in_redirect
      redirect '/?error=You have to be logged in to do that' if !logged_in?
    end

		def logged_in?
			!!current_user
		end

		def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def already_logged_in_redirect
      redirect '/' if logged_in?
    end

    def authorized_to_change?(recipe)
      redirect '/' unless recipe.user_id == current_user.id
    end

    @@measurements = ["cup", "teaspoon", "tablespoon", "each", "grams", "ounces", "lbs", "millilitres"]

	end
end
