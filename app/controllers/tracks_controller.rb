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
    if Rails.env.production?
      head(:x_accel_redirect => @track.mp3.url,
           :content_type => @track.mp3.content_type,
           :content_disposition => "attachment; filename=\"#{@track.mp3_file_name}\"")
    else
      send_file "#{RAILS_ROOT}/public#{@track.mp3.url}", :type => 'audio/mpeg'
    end
  end

end
