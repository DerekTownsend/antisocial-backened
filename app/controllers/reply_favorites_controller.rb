class ReplyFavoritesController < ApplicationController
  def create
    favorite = ReplyFavorite.create(reply_favorite_params)
    render json: CommentSerializer.new(favorite.reply.comment).to_serialized_json
  end

  def destroy
    favorite = ReplyFavorite.find_by(id: params[:id])
    reply = favorite.reply
    favorite.destroy
    render json: CommentSerializer.new(reply.comment).to_serialized_json
  end

  private
  def reply_favorite_params
    params.require(:reply_favorite_params).permit(:user_id, :reply_id)
  end

end
