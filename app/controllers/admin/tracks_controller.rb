class Admin::TracksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_artist, :except => [:index, :destroy]
  before_filter :set_sub_tab, :only => [:index, :new, :edit]

  layout 'admin'

  respond_to :html

  def index
    @tracks = Track.all
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(params[:track])
    @track.save
    respond_with :admin, @track
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    @track.update_attributes(params[:track])
    respond_with :admin, @track
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    respond_with :admin, @track
  end

protected

  def load_artist
    @artists = Artist.all
  end

end
