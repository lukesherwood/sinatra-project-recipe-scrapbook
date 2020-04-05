require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
		set :session_secret, "recipe_password"
  end

  get "/" do
    erb :index
  end

  helpers do
		def logged_in?
			!!current_user
		end

		def current_user
      USER.find(session[:user_id])
      # or @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def input_valid?
      !params[:name].empty? && !params[:ingredients].empty? && !params[:method].empty?
    end
    
	end

end
