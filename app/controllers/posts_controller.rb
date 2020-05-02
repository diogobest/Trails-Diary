# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(permitted_params)
    @post.profile_id = current_user.profile.id
    @post.author = current_user.profile.name
    if @post.save
      flash[:notice] = I18n.translate('posts.created')
      redirect_to root_path
    else
      flash.now[:alert] = I18n.translate('posts.required_field')
      redirect_back(fallback_location: {action: 'new'})
    end
  end

  private

  def permitted_params
    params.require(:post)
      .permit(:title, :text, :location)
  end
end
