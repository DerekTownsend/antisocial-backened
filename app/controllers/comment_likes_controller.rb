class CommentLikesController < ApplicationController
  def create
    comment = Comment.find_by(id: params[:comment_id])
    comment_dislike_exists = comment.comment_dislikes.find_by(user_id: params[:user_id])
    if comment_dislike_exists
      comment_dislike_exists.destroy
    end
    comment_like = CommentLike.create(comment_like_params)

    render json: CommentSerializer.new(comment_like.comment).to_serialized_json
  end

  def destroy
    comment_like = CommentLike.find_by(id: params[:id])
    comment = comment_like.comment
    comment_like.destroy
    render json: CommentSerializer.new(comment).to_serialized_json
  end

  private
  def comment_like_params
    params.require(:comment_like).permit(:user_id, :comment_id)
  end

end
