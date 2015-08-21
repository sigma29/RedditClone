class PostsController < ApplicationController

  before_action :require_be_author, only: [:edit, :update]

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to subs_url
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :post_sub_ids => [])
  end

  def require_be_author
    redirect_to post_url(params[:id]) unless current_user.is_author?(params[:id])
  end

end
