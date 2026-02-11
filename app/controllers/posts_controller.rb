class PostsController < ApplicationController
  def index
    @posts = Post.published_live.includes(:category).order(published_at: :desc)
  end

  def show
    @post = Post.published_live.find(params[:id])
  end
end
