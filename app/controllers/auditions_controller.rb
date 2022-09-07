# frozen_string_literal: true

# Audition controller
class AuditionsController < ApplicationController
  before_action :find_audition, only: [:show]

  # GET audition/index
  def index
    @auditions = Audition.all
  end

  # Post audition/new
  def new
    @audition = Audition.new
  end

  # Post audition/Create
  def create
    @audition = Audition.new(audition_params)
    if @audition.save
      redirect_to @audition
    else
      render 'new'
    end
  end

  # Get audition/show:id
  def show; end

  private

  def find_audition
    @audition = Audition.find(params[:id])
  end

  def audition_params
    params.require(:audition).permit(:first_name, :last_name, :email, :artist_name, :genre)
  end
end
