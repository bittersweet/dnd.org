class TracksController < ApplicationController
  
  def show
    @track = Track.find(params[:id])
    @artist = Artist.find(@track.artist_id)
    @tracks = @artist.tracks.all
    @tracks.delete(@track) #Removes the current displayed track from the tracklisting
  end
  
  def index
    @tracks = Track.paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
  end

  def download
    @track = Track.find(params[:track_id])
    @track.update_playcount(request.env)
    send_file "#{RAILS_ROOT}/public#{@track.mp3.url}", :type => 'audio/mpeg',
                                                       :x_sendfile => true
  end

end
