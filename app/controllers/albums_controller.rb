# frozen_string_literal: true

# Album controller
class AlbumsController < ApplicationController
  before_action :find_album, only: %i[show edit update destroy]
  before_action :find_user

  def index
    @albums = @user.albums
  end

  def new
    @album = @user.albums.new
  end

  def create
    @album = @user.albums.create(album_params)
    if @album.save
      redirect_to user_albums_path(current_user)
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @album.update(album_params)
      redirect_to user_albums_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @album.destroy
    redirect_to user_albums_path(current_user.id)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :picture)
  end
end
