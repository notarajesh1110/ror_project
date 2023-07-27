class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(parent_comment_id: params[:parent_comment_id])
  end

  def create
    @post = Post.find(params[:post_id])
    if comment_params[:parent_id].present?
      parent_comment = Comment.find(comment_params[:parent_id])
      @comment = parent_comment.replies.build(comment_params)
    else
      @comment = @post.comments.build(comment_params)
    end

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body,:parent_comment_id,:post_id)
  end

#   def valid_new?
#     p.param!  :parent_comment_id, Integer, required: true
#     p.param!  :post_id, Integer, required: true

#   end

end