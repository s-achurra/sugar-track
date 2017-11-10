class PostsController < ApplicationController
  def index
    @posts = Post.posts_by(current_user)
  end
end
