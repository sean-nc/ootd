class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def show
    @user = User.find(@post.user_id)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
      flash[:notice] = "Post was successfully created."
    else
      render 'new'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post was successfully destroyed."
    redirect_to current_user
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
