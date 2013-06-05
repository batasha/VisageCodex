class AlbumsController < ApplicationController
  def index
    @user = User.includes(:albums).find(params[:user_id])
    @albums = @user.albums
    @album = Album.new
  end

  def create
    @user.albums.create(params[:album])
  end

  def show
    @user = User.find(params[:user_id])
    @album = Album.find(params[:id])
    @photos = @album.photos
  end
end