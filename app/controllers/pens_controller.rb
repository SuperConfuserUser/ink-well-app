class PensController < ApplicationController

  get "/pens/?" do
    erb :"/pens/index.html"
  end

  get "/pens/new/?" do
    erb :"/pens/new.html"
  end

  post "/pens/?" do
    redirect "/pens"
  end

  get "/pens/:id/?" do
    erb :"/pens/show.html"
  end

  get "/pens/:id/edit/?" do
    erb :"/pens/edit.html"
  end

  patch "/pens/:id/?" do
    redirect "/pens/:id"
  end

  delete "/pens/:id/delete/?" do
    redirect "/pens"
  end
end
