class PostsController < ApplicationController
  def index
    @posts = current_user.posts
    @levels = current_user.post_data
  end
end
