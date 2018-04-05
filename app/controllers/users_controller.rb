class UsersController < ApplicationController

  get "/users/?" do
    @users = User.all
    erb :"/users/index.html"
  end

  get "/users/new/?" do
    redirect "users/desk" if logged_in?
    erb :"/users/new.html"
  end

  get "/users/desk/?" do
    @user = current_user
    erb :"users/desk.html"
  end

  get "/users/delete_warning/?" do
    log_in!
    @user = current_user
    erb :"users/delete.html"
  end

  get "/users/:slug/?" do
    @user = slugged
    erb :"/users/show.html"
  end

  get "/users/:slug/edit/?" do
    log_in!
    @user = slugged

    # redirect "/users/#{@user.slug}" if !owner(@user)

    erb :"/users/edit.html"
  end

  get "/users/:slug/pens/?" do
    @pens = slugged.pens

    if @pens.empty?
      flash_message("This user doesn't have any pens.", "error")
      redirect "/users/#{params[:slug]}"
    end

    erb :"/users/pens.html"
  end

  get "/users/:slug/inks/?" do
    @inks = slugged.inks
    if @inks.empty?
      flash_message("This user doesn't have any inks.", "error")
      redirect "/users/#{params[:slug]}"
    end

    erb :"/users/inks.html"
  end

  post "/users/?" do
    @user = User.create(params[:user])

    if !@user.valid?
      flash_error(@user)
      redirect back
    end

    session[:user_id] = @user.id
    redirect "/users/#{@user.slug}"
  end

  patch "/users/:slug/?" do
    @user = slugged
    @user.update(params[:user])

    if !@user.valid?
      flash_error(@user)
      redirect back
    end

    redirect "/users/#{@user.slug}"
  end

  delete "/users/:slug/delete/?" do
    if !@user.authenticate(params[:password])
      flash_message("That password didn't work.", "error")
      redirect "/users/delete_warning"
    end

    session.clear
    @user.pens.each(&:delete)
    @user.inks.each(&:delete)
    @user.delete

    flash_message("The account has been deleted.", "success")
    redirect "/"
  end
end
