class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
    if current_user.profile == nil
      redirect_to new_profile_path
    end
  end

end
