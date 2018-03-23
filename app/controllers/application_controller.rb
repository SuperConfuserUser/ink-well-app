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
    redirect '/login'
  end

  post '/login/?' do

  end

  helpers do
		def logged_in?
			!!current_user
		end

		def current_user
			User.find(session[:user_id])
		end

    def validate?
      !self.any?{|obj| obj.emtpy?}
    end
	end

end
