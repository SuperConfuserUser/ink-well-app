class InksController < ApplicationController

  get "/inks/?" do
    erb :"/inks/index.html"
  end

  get "/inks/new/?" do
    erb :"/inks/new.html"
  end

  post "/inks/?" do
    redirect "/inks"
  end

  get "/inks/:id/?" do
    erb :"/inks/show.html"
  end

  get "/inks/:id/edit/?" do
    erb :"/inks/edit.html"
  end

  patch "/inks/:id/?" do
    redirect "/inks/:id"
  end

  delete "/inks/:id/delete/?" do
    redirect "/inks"
  end
end
