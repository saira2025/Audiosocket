# frozen_string_literal: true

# Album controller
class AlbumsController < ApplicationController
  before_action :find_album, only: %i[show edit update destroy]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    if @album.save
      redirect_to albums_path
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @album.update(album_params)
      redirect_to albums_path
    else
      render 'edit'
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_path
  end

  private

  def find_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :picture)
  end
end
