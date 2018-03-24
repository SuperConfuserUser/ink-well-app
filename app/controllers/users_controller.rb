class UsersController < ApplicationController

  get "/users/?" do
    @users = User.all
    erb :"/users/index.html"
  end

  get "/users/new/?" do
    erb :"/users/new.html"
  end

  get "/users/:slug/?" do
    @user = User.find_by_slug(params[:slug])
    erb :"/users/show.html"
  end

  get "/users/:slug/edit/?" do
    @user = User.find_by_slug(params[:slug])
    erb :"/users/edit.html"
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

  patch "/users/:slug/?" do
    redirect "/users/:slug"
  end

  delete "/users/:slug/delete/?" do
    redirect "/users"
  end
end
