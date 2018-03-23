class InkControllersController < ApplicationController

  # GET: /ink_controllers
  get "/ink_controllers" do
    erb :"/ink_controllers/index.html"
  end

  # GET: /ink_controllers/new
  get "/ink_controllers/new" do
    erb :"/ink_controllers/new.html"
  end

  # POST: /ink_controllers
  post "/ink_controllers" do
    redirect "/ink_controllers"
  end

  # GET: /ink_controllers/5
  get "/ink_controllers/:id" do
    erb :"/ink_controllers/show.html"
  end

  # GET: /ink_controllers/5/edit
  get "/ink_controllers/:id/edit" do
    erb :"/ink_controllers/edit.html"
  end

  # PATCH: /ink_controllers/5
  patch "/ink_controllers/:id" do
    redirect "/ink_controllers/:id"
  end

  # DELETE: /ink_controllers/5/delete
  delete "/ink_controllers/:id/delete" do
    redirect "/ink_controllers"
  end
end
