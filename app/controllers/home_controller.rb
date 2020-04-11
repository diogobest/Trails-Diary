# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :authenticate_user!

  def index
    return redirect_to new_profile_path if current_user.profile.nil?

    @posts = Post.all
  end
end
