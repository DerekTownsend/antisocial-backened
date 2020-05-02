class ReplyDislikesController < ApplicationController
  def create
    comment = Comment.find_by(id: comment_dislike_params[:comment_id])
    comment_like_exists = comment.comment_likes.find_by(user_id: comment_dislike_params[:user_id])
    if comment_like_exists
      comment_like_exists.destroy
    end
    comment_dislike = CommentDislike.create(comment_dislike_params)

    render json: CommentSerializer.new(comment_dislike.comment).to_serialized_json
  end

  def destroy
    comment_dislike = CommentDislike.find_by(id: params[:id])
    comment = comment_dislike.comment
    comment_dislike.destroy
    render json: CommentSerializer.new(comment).to_serialized_json
  end

  private
  def comment_dislike_params
    params.require(:comment_dislike).permit(:user_id, :comment_id)
  end

end
