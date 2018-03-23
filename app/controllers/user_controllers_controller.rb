class UserControllersController < ApplicationController

  # GET: /user_controllers
  get "/user_controllers" do
    erb :"/user_controllers/index.html"
  end

  # GET: /user_controllers/new
  get "/user_controllers/new" do
    erb :"/user_controllers/new.html"
  end

  # POST: /user_controllers
  post "/user_controllers" do
    redirect "/user_controllers"
  end

  # GET: /user_controllers/5
  get "/user_controllers/:id" do
    erb :"/user_controllers/show.html"
  end

  # GET: /user_controllers/5/edit
  get "/user_controllers/:id/edit" do
    erb :"/user_controllers/edit.html"
  end

  # PATCH: /user_controllers/5
  patch "/user_controllers/:id" do
    redirect "/user_controllers/:id"
  end

  # DELETE: /user_controllers/5/delete
  delete "/user_controllers/:id/delete" do
    redirect "/user_controllers"
  end
end
