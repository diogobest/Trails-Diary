# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(permitted_params)
      redirect_to @profile
    else
      render :edit
    end
  end

  def create
    @profile = Profile.new(permitted_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to @profile
    else
      render :new
    end
  end

  private

  def permitted_params
    params.require(:profile)
          .permit(:name, :age, :user_id, :username, :city, :state)
  end
end
