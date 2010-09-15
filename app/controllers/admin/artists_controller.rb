class Admin::ArtistsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_sub_tab, :only => [:edit, :index]

  layout 'admin'

  def index
    @artists = Artist.ordered
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(params[:artist])
    if @artist.save
      redirect_to admin_artists_path, :notice => 'Artist created.'
    else
      render 'new'
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      redirect_to admin_artists_path, :notice => 'Artist updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to admin_artists_path, :notice => 'Artist deleted.'
  end

end
