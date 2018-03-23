class PensController < ApplicationController

  # GET: /pens
  get "/pens/?" do
    erb :"/pens/index.html"
  end

  # GET: /pens/new
  get "/pens/new/?" do
    erb :"/pens/new.html"
  end

  # POST: /pens
  post "/pens/?" do
    redirect "/pens"
  end

  # GET: /pens/5
  get "/pens/:id/?" do
    erb :"/pens/show.html"
  end

  # GET: /pens/5/edit
  get "/pens/:id/edit/?" do
    erb :"/pens/edit.html"
  end

  # PATCH: /pens/5
  patch "/pens/:id/?" do
    redirect "/pens/:id"
  end

  # DELETE: /pens/5/delete
  delete "/pens/:id/delete/?" do
    redirect "/pens"
  end
end
