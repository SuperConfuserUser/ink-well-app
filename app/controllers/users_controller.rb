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
    @user = User.find_by_slug(params[:slug])

    if !@user == current_user
      flash[:message] = ["<strong>Uh Oh!</strong>  You're not allowed to do that.", "error"]
      redirect "/"
    end

    erb :"/users/edit.html"
  end

  get "/users/:slug/pens/?" do
    if @pens = User.find_by_slug(params[:slug]).pens.empty?
      flash[:message] = ["<strong>Uh Oh!</strong>  This user doesn't have any pens.", "error"]
      redirect "/users/#{params[:slug]}"
    end

    erb :"/users/pens.html"
  end

  get "/users/:slug/inks/?" do
    if @inks = User.find_by_slug(params[:slug]).inks.empty?
      flash[:message] = ["<strong>Uh Oh!</strong>  This user doesn't have any inks.", "error"]
      redirect "/users/#{params[:slug]}"
    end

    erb :"/users/inks.html"
  end

  post "/users/?" do
    @user = User.new(params[:user])

    if @user.save
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    end

    redirect "/users/new"
  end

  patch "/users/:slug/?" do
    @user = current_user.update(params[:user])

    if !@user.save
      flash[:message] = ["<strong>Uh Oh!</strong>  The edit didn't work.", "error"]
      redirect "/users/#{current_user.slug}"
    end

    flash[:message] = ["<strong>Sweet Success!</strong>  You did it!", "success"]
    redirect "/users/#{current_user.slug}/edit"
  end

  delete "/users/:slug/delete/?" do
    if !@user.authenticate(params[:password])
      flash[:message] = ["<strong>Uh Oh!</strong>  That password didn't work.", "error"]
      redirect "/users/delete_warning"
    end

    session.clear
    @user.pens.each(&:delete)
    @user.inks.each(&:delete)
    @user.delete
    flash[:message] = ["<strong>Info</strong>  The account has been deleted.", nil]
    redirect "/"
  end
end
