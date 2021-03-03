class TracksController < ApplicationController
  before_action :set_album, only: [:create]

  def show
    @track = Track.find_by(id: params[:id])

    render :show
  end

  def create
    @track = @album.tracks.new(track_params)
    if @track.save!
      redirect_to track_url(@track)
    else
      render :new
    end 
  end

  def new
    render :new
  end

  def update
    @track = Track.find_by(id: params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      render :edit
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    render :edit
  end

  def destroy
    track = Track.find_by(id: params[:id])

    track.destroy
  end

  private
  def track_params 
    params.require(:track).permit(:title, :ord, :lyrics, :track_type)
  end

  def set_album
    @album = Album.find(params[:album_id])
  end
end
