require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "why_do_you_have_so_many_inks"
  end

  get "/" do
    erb :welcome
  end

end
