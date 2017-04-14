class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash.notice = "Successfully added Comment!"
      redirect_to @post
    else
      flash.now.alert = "There was an error"
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
