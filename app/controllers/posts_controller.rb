class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
      flash[:notice] = "Post was successfully created."
    else
      render 'new'
    end

  def update
    if @post.update(post_params)
      redirect_to @post
      flash[:notice] = "Post was successfully edited."
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post was successfully destroyed."
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :image)
    end
end
