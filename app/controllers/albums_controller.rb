class AlbumsController < ApplicationController
  def index
    @user = User.includes(:albums).find(params[:user_id])
    @albums = @user.albums
    @album = Album.new
  end

  def create
    @user = User.find(params[:user_id])
    @user.albums.create(params[:album])
    redirect_to user_albums_path(@user)
  end

  def show
    @user = User.find(params[:user_id])
    @album = Album.find(params[:id])
    @photos = @album.photos
    @photo = Photo.new
  end
end