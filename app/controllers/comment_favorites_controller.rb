class CommentFavoritesController < ApplicationController
  def create
    favorite = CommentFavorite.create(favorite_params)
    render json: CommentSerializer.new(favorite.comment).to_serialized_json
  end

  def destroy
    favorite = CommentFavorite.find_by(id: params[:id])
    comment = favorite.comment
    favorite.destroy
    render json: CommentSerializer.new(comment).to_serialized_json
  end

  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :comment_id)
  end

end
