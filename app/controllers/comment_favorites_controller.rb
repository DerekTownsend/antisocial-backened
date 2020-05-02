class CommentFavoritesController < ApplicationController
  def create
    favorite = CommentFavorite.create(comment_favorite_params)
    render json: CommentSerializer.new(favorite.comment).to_serialized_json
  end

  def destroy
    favorite = CommentFavorite.find_by(id: params[:id])
    comment = favorite.comment
    favorite.destroy
    render json: CommentSerializer.new(comment).to_serialized_json
  end

  private
  def comment_favorite_params
    params.require(:comment_favorite).permit(:user_id, :comment_id)
  end

end
