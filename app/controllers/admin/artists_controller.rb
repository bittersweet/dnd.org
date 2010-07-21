class Admin::ArtistsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_sub_tab, :only => [:new, :edit, :index]

  layout 'admin'

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(params[:artist])
    if @artist.save
      flash[:notice] = 'Artist saved'
      redirect_to admin_artists_path
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
      redirect_to admin_artists_path
    else
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to admin_artists_path
    flash[:notice] = 'Artist deleted'
  end

  def index
    @artist = Artist.all
  end

end
