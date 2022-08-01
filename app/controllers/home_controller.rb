class HomeController < ApplicationController
  def index
    @posts = Post.published.order(created_at: :desc)
  end
end