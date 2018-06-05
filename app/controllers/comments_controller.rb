class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Comment successfully added"
      redirect_to [@comment.post.user, @comment.post]
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.user == current_user || @post.user
      @comment.destroy
      flash[:alert] = "Comment successfully deleted"
      redirect_to [@comment.post.user, @comment.post]
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
