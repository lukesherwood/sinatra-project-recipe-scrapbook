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
    
    def not_logged_in_redirect
      if logged_in?
      else
        redirect '/'
      end
    end

		def logged_in?
			!!current_user
		end

		def current_user
      @current_user ||= USER.find_by(id: session[:user_id]) if session[:user_id]
    end

    def input_valid?
      !params[:name].empty? && !params[:ingredients].empty? && !params[:method].empty?
    end
    
    def already_logged_in_redirect
      if !logged_in?
      else
        redirect '/recipes'
      end
    end

	end
end
