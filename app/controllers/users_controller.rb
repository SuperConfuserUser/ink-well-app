class UsersController < ApplicationController

  get "/users/?" do
    @users = User.all
    erb :"/users/index.html"
  end

  get "/users/new/?" do
    erb :"/users/new.html"
  end

  get "/users/delete_warning/?" do
    @user = current_user
    erb :"users/delete.html"
  end

  get "/users/:slug/?" do
    @user = User.find_by_slug(params[:slug])
    erb :"/users/show.html"
  end

  get "/users/:slug/edit/?" do
    erb :"/users/edit.html"
  end

  post "/users/?" do
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      redirect "/users/new"
    end
  end

  patch "/users/:slug/?" do
    @user = current_user
    @user.update(params[:user])
    redirect @user.save ? "/users/#{current_user.slug}" : "/users/#{current_user.slug}/edit"
  end

  delete "/users/:slug/delete/?" do
    @user = current_user

    redirect "/" if @user
    redirect "/users/delete_warning" if !@user.authenticate(params[:password])

    session.clear
    @user.pens.each(&:delete)
    @user.inks.each(&:delete)
    @user.delete
    redirect "/"
  end
end
