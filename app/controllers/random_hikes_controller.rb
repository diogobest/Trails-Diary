# frozen_string_literal: true

class RandomHikesController < ApplicationController
  def index
    @hikes = FetchRandomHikes.fetch_hikes
  end

  def search
    #TODO: Maybe use the gem geolocade for this...
  end

  private

  def permitted_params
    params.require(:search)
  end
end
