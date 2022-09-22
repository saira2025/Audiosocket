# frozen_string_literal: true

# Audition controller
class AuditionsController < ApplicationController
  before_action :find_audition, only: [:show]
  helper_method :sort_column, :sort_direction

  # GET audition/index
  def index # rubocop:disable Metrics/MethodLength
    result = AuditionStatus.call(
      status: params[:status],
      search: params[:q],
      page: params[:page],
      sort_column: sort_column,
      sort_direction: sort_direction
    )
    @q = result.q
    @auditions = result.auditions

    respond_to do |format|
      format.html
      format.csv { send_data @auditions.to_csv }
    end
  end

  # Post audition/new
  def new
    @audition = Audition.new
  end

  # Post audition/Create
  def create
    @audition = Audition.new(audition_params)
    if @audition.save
      redirect_to auditions_path
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
    params.require(:audition).permit(:first_name, :last_name, :email, :artist_name, :genre, :about_us,
                                     :additional_info, :status, songs_attributes: [:link])
  end

  def sort_column
    Audition.column_names.include?(params[:sort]) ? params[:sort] : 'first_name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
