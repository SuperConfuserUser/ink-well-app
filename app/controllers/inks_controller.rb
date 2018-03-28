class InksController < ApplicationController

  get "/inks/?" do
    erb :"/inks/index.html"
  end

  get "/inks/new/?" do
    erb :"/inks/new.html"
  end

  post "/inks/?" do
    binding.pry
    type = params[:type] || params[:pen_type][:name]

    valid = ![type, params[:brand], params[:pen][:model]].any?(&:empty?)

    redirect "/pens/new" if !valid

    @ink = Ink.new(params[:ink])
    @ink.ink_brand = InkBrand.find_or_create_by(name: params[:brand])
    @ink.ink_type = (InkType.find(params[:type]) if params[:type]) || InkType.find_or_create_by(params[:ink_type])
    @ink.user = current_user if current_user

    redirect @ink.save ? "/inks/#{@ink.id}" : "/inks/new"
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
