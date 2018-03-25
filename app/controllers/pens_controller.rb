class PensController < ApplicationController

  get "/pens/?" do
    @pens = Pen.all
    erb :"/pens/index.html"
  end

  get "/pens/new/?" do
    erb :"/pens/new.html"
  end

  post "/pens/?" do
    type = params[:type] || params[:pen_type][:name]

    valid = ![type, params[:brand], params[:pen][:model]].any?(&:empty?)

    redirect "/pens/new" if !valid

    @pen = Pen.new(params[:pen])
    @pen.pen_brand = PenBrand.find_or_create_by(name: params[:brand])
    @pen.pen_type = (PenType.find(params[:type].to_i) if params[:type]) || PenType.find_or_create_by(params[:pen_type])
    @pen.user = current_user if current_user

    redirect @pen.save ? "/pens/#{@pen.id}" : "/pens/new"
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
