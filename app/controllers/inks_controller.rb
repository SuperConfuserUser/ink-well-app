class InksController < ApplicationController

  # GET: /inks
  get "/inks/?" do
    erb :"/inks/index.html"
  end

  # GET: /inks/new
  get "/inks/new/?" do
    erb :"/inks/new.html"
  end

  # POST: /inks
  post "/inks/?" do
    redirect "/inks"
  end

  # GET: /inks/5
  get "/inks/:id/?" do
    erb :"/inks/show.html"
  end

  # GET: /inks/5/edit
  get "/inks/:id/edit/?" do
    erb :"/inks/edit.html"
  end

  # PATCH: /inks/5
  patch "/inks/:id/?" do
    redirect "/inks/:id"
  end

  # DELETE: /inks/5/delete
  delete "/inks/:id/delete/?" do
    redirect "/inks"
  end
end
