class PensController < ApplicationController

  get "/pens/?" do
    @pens = Pen.all
    erb :"/pens/index.html"
  end

  get "/pens/new/?" do
    erb :"/pens/new.html"
  end

  get "/pens/:id/?" do
    @pen = Pen.find(params[:id])
    erb :"/pens/show.html"
  end

  get "/pens/:id/edit/?" do
    @pen = Pen.find(params[:id])
    erb :"/pens/edit.html"
  end

  post "/pens/?" do
    type = params[:type] || params[:pen_type][:name]

    @pen = Pen.new(params[:pen])

    @pen.pen_brand = PenBrand.find_or_create_by(name: params[:brand]) if !params[:brand].empty?
    if !type.empty?
      @pen.pen_type = (PenType.find(params[:type]) if params[:type]) || PenType.find_or_create_by(params[:pen_type])
    end
    @pen.user = current_user if current_user

    if !@pen.save
      flash_error(@pen)
      redirect "pens/new"
    end

    redirect "/pens/#{@pen.id}"
  end

  patch "/pens/:id/?" do
    @pen = Pen.find(params[:id])

    type = params[:type] || params[:pen_type][:name]

    @pen.update(params[:pen])
    @pen.favorite = params[:pen][:favorite]
    !params[:brand].empty? ? @pen.pen_brand = PenBrand.find_or_create_by(name: params[:brand]) : @pen.pen_brand = nil
    if !type.empty?
      @pen.pen_type = (PenType.find(params[:type]) if params[:type]) || PenType.find_or_create_by(params[:pen_type])
    else
      @pen.pen_type = nil
    end

    if !@pen.save
      flash_error(@pen)
      redirect "/pens/#{@pen.id}/edit"
    end

    flash_message("Pen has been updated.", "success")
    redirect "/pens/#{@pen.id}"
  end

  delete "/pens/:id/delete/?" do
    @pen = Pen.find(params[:id])

    redirect "/pens" if !@pen
    redirect "/pens/#{@pen.id}" if @pen.user != current_user

    @pen.delete
    redirect "/pens"
  end
end
