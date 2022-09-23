# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update]

  def show; end

  def update
    if @user.update(user_params)
      redirect_to albums_path
    else
      render 'edit'
    end
  end

  # Put audition/update:id
  def edit; end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:country, :bio, :website_link, :image, social_link: [])
  end
end
