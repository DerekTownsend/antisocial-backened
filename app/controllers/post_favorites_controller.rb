class PostFavoritesController < ApplicationController
  def create
    favorite = PostFavorite.create(favorite_params)
    render json: PostSerializer.new(favorite.post).to_serialized_json
  end

  def destroy
    favorite = PostFavorite.find_by(id: params[:id])
    post = favorite.post
    favorite.destroy
    render json: PostSerializer.new(post).to_serialized_json
  end

  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :post_id)
  end

end
