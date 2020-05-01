class ReplyLikesController < ApplicationController
  def create
    reply = Reply.find_by(id: params[:reply_id])
    reply_dislike_exists = reply.reply_dislikes.find_by(user_id: params[:user_id])
    if reply_dislike_exists
      reply_dislike_exists.destroy
    end
    reply_like = ReplyLike.create(reply_like_params)

    render json: CommentSerializer.new(reply_like.reply.comment).to_serialized_json
  end

  def destroy
    reply_like = ReplyLike.find_by(id: params[:id])
    reply = reply_like.reply
    reply_like.destroy
    render json: CommentSerializer.new(reply.comment).to_serialized_json
  end

  private
  def reply_like_params
    params.require(:reply_like).permit(:user_id, :reply_id)
  end

end
