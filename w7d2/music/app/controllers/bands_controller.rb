class BandsController < ApplicationController
  def index
    @bands = Band.all

    render :index
  end

  def show
    @band = Band.find_by(id: params[:id])
    if @band 
      render :show
    else
      redirect_to bands_url
    end
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  def new
    render :new
  end

  def edit
      render :edit
  end

  def update
    @band =  Band.find_by(id: params[:id])
    if @band
      if @band.update(band_params)
        redirect_to band_url(@band)
      else
        render :edit
      end
    end
  end

  def destroy
    band = Band.find_by(id: params[:id])
    band.destroy
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end

end
