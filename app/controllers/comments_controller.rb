class CommentsController < ApplicationController

  def new
    @post=Post.find(params[:post_id])
    @comment=Comment.new
  end

  def create
    @post = Post.find(params[:comment][:post_id])
    @comments = @post.comments.create!(params[:comment].permit(:body,:author))
    if @comments.save

      redirect_to @post
    else
      redirect_to post_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :body,:post_id)
  end
end
