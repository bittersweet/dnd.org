class TracksController < ApplicationController
  
  def show
    @track = Track.find(params[:id])
    @artist = Artist.find(@track.artist_id)
    @tracks = @artist.tracks.all
  end
  
  def index
    @tracks = Track.all.reverse
  end
  
end
