class PostDislikesController < ApplicationController
  def create
    post = Post.find_by(id: post_dislike_params[:post_id])
    post_like_exists = post.post_likes.find_by(user_id: post_dislike_params[:user_id])
    if post_like_exists
      post_like_exists.destroy
    end
    post_dislike = PostDislike.create(post_dislike_params)

    render json: PostSerializer.new(post_dislike.post).to_serialized_json
  end

  def destroy
    post_dislike = PostDislike.find_by(id: params[:id])
    post = post_dislike.post
    post_dislike.destroy
    render json: PostSerializer.new(post).to_serialized_json
  end

  private
  def post_dislike_params
    params.require(:post_dislike).permit(:user_id, :post_id)
  end

end
