class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, except: [:show, :index]
  
  def index
  	@posts = Post.all
	end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      flash[:notice] = "Your post has been submitted."
      redirect_to posts_path
    elsif 
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = "This post has been updated."
      redirect_to post_path(@post)
    elsif 
      render :edit
    end
  end

  def vote
    Vote.create(voteable: @post, creator: current_user, vote: params[:vote])
    flash[:notice] = 'Your vote was counted.'
    redirect_to :back
  end

  private

  
  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
