class AlbumsController < ApplicationController
  before_action :set_band, only: [:create]

  def index
    @albums = Album.all

    render :index
  end

  def show
    @album = Album.find_by(id: params[:id])

    if @album
      render :show
    else
      redirect_to albums_url
    end
  end

  def new
    render :new
  end
  
  def create
    # new_params = album_params[:album][:band_id] = params[:band_id]
    # @album = Album.new(new_params)
    # @album = Album.new(new_params)
     @album = @band.albums.new(album_params)
    if @album.save!
      redirect_to album_url(@album)
    else
      render :new
    end
  end

  def destroy
    album = Album.find(id: params[:id])
    album.destroy
  end

  def update
    @album = Album.find(id: params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end

  end

  def edit
    render :edit
  end

  private
  def set_band
    @band = Band.find(params[:band_id])
  end

  def album_params 
    params.require(:album).permit(:title, :year, :live)
  end

end
