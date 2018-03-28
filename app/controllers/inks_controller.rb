class InksController < ApplicationController

  get "/inks/?" do
    erb :"/inks/index.html"
  end

  get "/inks/new/?" do
    erb :"/inks/new.html"
  end

  post "/inks/?" do
    valid = ![params[:brand], params[:ink][:name]].any?(&:empty?) && logged_in?

    redirect "/inks/new" if !valid

    @ink = Ink.new(params[:ink])
    @ink.ink_brand = InkBrand.find_or_create_by(name: params[:brand])
    @ink.color_family_ids = params[:color_families]
    @ink.user = current_user if current_user

    redirect @ink.save ? "/inks/#{@ink.id}" : "/inks/new"
  end

  get "/inks/:id/?" do
    @ink = Ink.find(params[:id])
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
