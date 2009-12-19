class TracksController < ApplicationController
  
  def show
    @track = Track.find(params[:id])
    @artist = Artist.find(@track.artist_id)
    @tracks = @artist.tracks.all
    @tracks.delete(@track) #Removes the current displayed track from the tracklisting
  end
  
  def index
    @tracks = Track.all
  end

  def download
    @track = Track.find(params[:track_id])
    @track.update_playcount(request.env)
    send_file "#{RAILS_ROOT}/public#{@track.mp3.url}", :type => 'audio/mpeg',
                                                       :x_sendfile => Rails.env.production?
  end

end
