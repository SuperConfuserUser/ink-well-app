class UsersController < ApplicationController

  get "/users/?" do
    @users = User.all
    erb :"/users/index.html"
  end

  get "/users/new/?" do
    erb :"/users/new.html"
  end

  post "/users/?" do
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect "/users/new"
    end
  end

  get "/users/:slug/?" do
    erb :"/users/show.html"
  end

  get "/users/:slug/edit/?" do
    erb :"/users/edit.html"
  end

  patch "/users/:slug/?" do
    redirect "/users/:slug"
  end

  delete "/users/:slug/delete/?" do
    redirect "/users"
  end
end
