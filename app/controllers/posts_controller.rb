class PostsController < ApplicationController

def index
 @posts=Post.all
end

def new
  @post = Post.new
end

def create
  @post=Post.new(post_params)
  puts post_params
  if @post.save
    redirect_to posts_url
  else
    redirect_to new_post_url
  end
end

def show
  @post=Post.find(params[:id])
end


def edit
  @post = Post.find(params[:id])
end

def update
  post = Post.find(params[:id])
  post.update(post_params)

  redirect_to post
end

def destroy
  post = Post.find(params[:id])
  post.destroy

  redirect_to posts_path
end

private
def post_params
  params.require(:post).permit(:body, :title)
end

end
