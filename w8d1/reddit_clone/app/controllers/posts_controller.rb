class PostsController < ApplicationController
  before_action(:require_signed_in, only: [:create, :show])

  def new
    @post = Post.new
    render(:new)
  end 

  def create
    @post = Post.new(params.require(:post).permit(:title, :url, :content, :sub))
    @post.user_id = params[:user_id]

    if @post.save ==  false
      flash[:errors] = @post.errors.full_messages
    end
    redirect_to user_url(@post.user_id)
  end

  def show
    @post = Post.find_by(id: params[:id])
    render(:show)
  end

  def edit
    @post = Post.new
    render :edit
  end

  def update
    @post  = Post.find_by(id: params[:id])

    if @post && @post.update(params.require(:post).permit(:title, :url, :content))
      redirect_to user_url(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    if @post && @post.destroy
      redirect_to users_url
    else
      redirect_to user_post_url(@post)
    end
  end

end
