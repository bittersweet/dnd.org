class TracksController < ApplicationController
  
  def show
    @track = Track.find(params[:id])
    @artist = Artist.find(@track.artist_id)
    @tracks = @artist.tracks.all
    @tracks.delete(@track) #Removes the current displayed track from the tracklisting
  end
  
  def index
    @tracks = Track.all.reverse
  end

  def playcount
    Track.update_playcount(params[:id], request.env)
    render :nothing => true
  end

end
