class TracksController < ApplicationController

  def index
    @tracks = Track.regular
  end

  def show
    @track  = Track.find(params[:id])
    @artist = @track.artist
    @tracks = @artist.tracks.reject { |t| t == @track }
  end

  def download
    @track = Track.find(params[:id])
    @track.update_playcount(request.env)
    if Rails.env.production?
      head(:x_accel_redirect => @track.mp3.url,
           :content_type => @track.mp3.content_type,
           :content_disposition => "attachment; filename=\"#{@track.mp3_file_name}\"")
    else
      send_file "#{RAILS_ROOT}/public#{@track.mp3.url}", :type => @track.mp3.content_type
    end
  end

end
