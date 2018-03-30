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
binding.pry
    valid = ![type, params[:brand], params[:pen][:model]].any?(&:empty?)

    redirect "/pens/new" if !valid

    @pen = Pen.new(params[:pen])
    @pen.pen_brand = PenBrand.find_or_create_by(name: params[:brand])
    @pen.pen_type = (PenType.find(params[:type]) if params[:type]) || PenType.find_or_create_by(params[:pen_type])
    @pen.user = current_user if current_user

    redirect @pen.save ? "/pens/#{@pen.id}" : "/pens/new"
  end

  get "/pens/:id/?" do
    @pen = Pen.find(params[:id])
    erb :"/pens/show.html"
  end

  get "/pens/:id/edit/?" do
    @pen = Pen.find(params[:id])
    erb :"/pens/edit.html"
  end

  patch "/pens/:id/?" do
    @pen = Pen.find(params[:id])
    redirect "/pens" if !@pen

    type = params[:type] || params[:pen_type][:name]

    valid = @pen.user == current_user && ![type, params[:brand], params[:pen][:model]].any?(&:empty?)

    redirect "/pens/#{@pen.id}/edit" if !valid

    @pen.update(params[:pen])
    @pen.favorite = params[:pen][:favorite]
    @pen.pen_brand = PenBrand.find_or_create_by(name: params[:brand])
    @pen.pen_type = (PenType.find(params[:type]) if params[:type]) || PenType.find_or_create_by(params[:pen_type])

    redirect @pen.save ? "/pens/#{@pen.id}" : "/pens/#{@pen.id}/edit"
  end

  delete "/pens/:id/delete/?" do
    @pen = Pen.find(params[:id])

    redirect "/pens" if !@pen
    redirect "/pens/#{@pen.id}" if @pen.user != current_user

    @pen.delete
    redirect "/pens"
  end
end
