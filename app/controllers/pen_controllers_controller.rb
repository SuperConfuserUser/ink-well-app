class PenControllersController < ApplicationController

  # GET: /pen_controllers
  get "/pen_controllers" do
    erb :"/pen_controllers/index.html"
  end

  # GET: /pen_controllers/new
  get "/pen_controllers/new" do
    erb :"/pen_controllers/new.html"
  end

  # POST: /pen_controllers
  post "/pen_controllers" do
    redirect "/pen_controllers"
  end

  # GET: /pen_controllers/5
  get "/pen_controllers/:id" do
    erb :"/pen_controllers/show.html"
  end

  # GET: /pen_controllers/5/edit
  get "/pen_controllers/:id/edit" do
    erb :"/pen_controllers/edit.html"
  end

  # PATCH: /pen_controllers/5
  patch "/pen_controllers/:id" do
    redirect "/pen_controllers/:id"
  end

  # DELETE: /pen_controllers/5/delete
  delete "/pen_controllers/:id/delete" do
    redirect "/pen_controllers"
  end
end
