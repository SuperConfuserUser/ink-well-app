require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "hand_cramps_are_lessened"
  end

  get "/" do
    erb :welcome
  end

  get '/login/?' do
    erb :welcome
  end

  get '/logout/?' do
    session.clear
    redirect '/login'
  end

  post '/login/?' do
    @user = User.find_by(username: params[:login]) || User.find_by(email: params[:login])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect "/login"
    end
  end

  helpers do
		def logged_in?
			!!current_user
		end

		def current_user
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
		end
	end

end
