class PensController < ApplicationController

  get "/pens/?" do
    erb :"/pens/index.html"
  end

  get "/pens/new/?" do
    erb :"/pens/new.html"
  end

  post "/pens/?" do
    type = (params[:pen_type][:name] if !params[:pen_type][:name].empty?) || params[:pen][:pen_type]
    valid = ![type, params[:pen][:pen_brand][:name], params[:pen][:model][:name]].any?(&:empty?)
    binding.pry
    redirect "/pens/new" if !valid

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
