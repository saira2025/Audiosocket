# frozen_string_literal: true

# Track controller
class TracksController < ApplicationController
  before_action :find_track, only: %i[show edit update destroy]
  before_action :find_album
  before_action :find_user

  def index
    @tracks = @album.tracks
  end

  def new
    @track = @album.tracks.new
  end

  def create
    @track = @album.tracks.create(track_params)
    if @track.save
      redirect_to user_album_tracks_path(current_user)
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @track.update(track_params)
      redirect_to user_album_tracks_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @track.destroy
    redirect_to user_album_track_path(current_user.id, @album_id)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_album
    @album = Album.find(params[:album_id])
  end

  def find_track
    @track = Track.find(params[:id])
  end

  def track_params
    params.require(:track).permit(:name, :song)
  end
end
