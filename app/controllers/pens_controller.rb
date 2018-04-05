class PensController < ApplicationController

  get "/pens/?" do
    @pens = Pen.all
    erb :"/pens/index.html"
  end

  get "/pens/new/?" do
    log_in!
    erb :"/pens/new.html"
  end

  get "/pens/:id/?" do
    @pen = Pen.find(params[:id])
    erb :"/pens/show.html"
  end

  get "/pens/:id/edit/?" do
    log_in!
    @pen = Pen.find(params[:id])
    redirect "/pens/#{@pen.id}" if !owner(@pen)
    erb :"/pens/edit.html"
  end

  post "/pens/?" do
    @pen = current_user.pens.new(params[:pen])
    brand = PenBrand.find_or_create_by(name: params[:brand])
    @pen.pen_brand = brand if brand.valid?
    type = params[:type] || params[:pen_type][:name]
    @pen.pen_type = (PenType.find(params[:type]) if params[:type]) || PenType.find_or_create_by(params[:pen_type]) if !type.empty?

    if !@pen.save
      flash_error(@pen)
      redirect back
    end

    redirect "/pens/#{@pen.id}"
  end

  patch "/pens/:id/?" do
    @pen = Pen.find(params[:id])

    @pen.update(params[:pen])
    @pen.favorite = params[:pen][:favorite]  #explicitly set because params[ink][favorite] won't go through if it's false
    brand = PenBrand.find_or_create_by(name: params[:brand])
    @pen.pen_brand = brand.valid? ? brand : nil
    type = params[:type] || params[:pen_type][:name]
    if !type.empty?
      @pen.pen_type = (PenType.find(params[:type]) if params[:type]) || PenType.find_or_create_by(params[:pen_type])
    else
      @pen.pen_type = nil
    end

    if !@pen.save
      flash_error(@pen)
      redirect back
    end

    redirect "/pens/#{@pen.id}"
  end

  delete "/pens/:id/delete/?" do
    @pen = Pen.find(params[:id])
    @pen.delete

    flash_message("Pen deleted.", "success")
    redirect "/pens"
  end
end
