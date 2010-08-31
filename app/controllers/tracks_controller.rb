class TracksController < ApplicationController

  def index
    @tracks = Track.ordered.regular
  end

  def show
    @track  = Track.find(params[:id])
    @artist = @track.artist
    @tracks = @artist.tracks.ordered.reject { |t| t == @track }
  end

  def download
    render :nothing => true
    @track = Track.find(params[:id])
    @track.update_playcount(request.env)
    if Rails.env.production?
      head(:x_accel_redirect => "/files#{@track.mp3.url}",
           :content_type => "audio/mpeg",
           :content_disposition => "attachment; filename=\"#{@track.mp3_file_name}\"")
    else
      send_file "#{Rails.root}/public#{@track.mp3.url}", :type => 'audio/mpeg'
    end
  end

end
