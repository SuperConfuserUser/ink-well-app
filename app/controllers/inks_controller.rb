class InksController < ApplicationController

  get "/inks/?" do
    @inks = Ink.all
    erb :"/inks/index.html"
  end

  get "/inks/new/?" do
    erb :"/inks/new.html"
  end

  get "/inks/:id/?" do
    @ink = Ink.find(params[:id])
    erb :"/inks/show.html"
  end

  get "/inks/:id/edit/?" do
    @ink = Ink.find(params[:id])
    redirect "/inks" if !@ink
    erb :"/inks/edit.html"
  end

  post "/inks/?" do
    @ink = Ink.new(params[:ink])
    !params[:brand].empty? ? @ink.ink_brand = InkBrand.find_or_create_by(name: params[:brand]) : @ink.ink_brand = nil
    @ink.color_family_ids = params[:color_families]
    @ink.user = current_user if current_user

    if !@ink.save
      flash_error(@ink)
      redirect "/inks/new"
    end

    redirect "/inks/#{@ink.id}"
  end

  patch "/inks/:id/?" do
    @ink = Ink.find(params[:id])

    @ink.update(params[:ink])
    @ink.favorite = params[:ink][:favorite]
      !params[:brand].empty? ? @ink.ink_brand = InkBrand.find_or_create_by(name: params[:brand]) : @ink.ink_brand = nil
    @ink.color_family_ids = params[:color_families]

    if !@ink.save
      flash_error(@ink)
      redirect "/inks/#{@ink.id}/edit"
    end

    flash_message("Ink has been updated.", "success")
    redirect "/inks/#{@ink.id}"
  end

  delete "/inks/:id/delete/?" do
    @ink = Ink.find(params[:id])
    @ink.delete
    redirect "/inks"
  end
end
