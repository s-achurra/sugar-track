class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_posts, only: [:index, :rails_search]

  def index
    @levels = current_user.posts_data
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      # TODO: decide if this should go to index or show
      redirect_to index
    else
      render :new
    end
  end

  def search
    @posts = current_user.posts_search(params.require(:dates).permit(:start_date, :end_date))
    render json: @posts
  end

  def rails_search
    @levels = current_user.posts_data(params.require(:post).permit(:start_date, :end_date))
    render :index
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:level, :notes)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_posts
    @posts = current_user.posts
  end

end
