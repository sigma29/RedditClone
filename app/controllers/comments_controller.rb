class CommentsController < ApplicationController
  def new
    @comment = Post.find(params[:post_id]).comments.new
    render :new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      post = @comment.post
      redirect_to post_url(post)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post
    comment.destroy
    redirect_to post_url(post)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :author_id, :post_id)
  end
end
