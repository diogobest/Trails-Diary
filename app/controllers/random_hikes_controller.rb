class RandomHikesController < ApplicationController
  def index
    @hikes = FetchRandomHikes.fetch_hikes
  end
end
