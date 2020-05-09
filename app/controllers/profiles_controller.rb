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
      flash[:notice] = I18n.t('profiles.updated')
      redirect_to @profile
    else
      flash[:alert] = I18n.t('profiles.errors.required_field')
      redirect_back(fallback_location: { action: 'edit' })
    end
  rescue CustomExceptions::InvalidAge
    flash[:alert] = I18n.t('profiles.errors.invalid_age')
    redirect_back(fallback_location: { action: 'edit' })
  end

  def create
    @profile = Profile.new(permitted_params)
    @profile.user_id = current_user.id
    if @profile.save
      flash[:notice] = I18n.t('profiles.created')
      redirect_to root_path
    else
      flash.now[:alert] = I18n.t('profiles.errors.required_field')
      redirect_back(fallback_location: { action: 'new' })
    end
  rescue CustomExceptions::InvalidAge
    flash[:alert] = I18n.t('profiles.errors.invalid_age')
    redirect_back(fallback_location: { action: 'create' })
  end

  private

  def permitted_params
    ValidateProfile.new(params: params.require(:profile)
      .permit(:name, :age, :user_id, :username, :city, :state)).valid?
  end
end
