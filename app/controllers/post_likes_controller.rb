class PostLikesController < ApplicationController
  def create

    post = Post.find_by(id: post_like_params[:post_id])
    post_dislike_exists = post.post_dislikes.find_by(user_id: post_like_params[:user_id])
    if post_dislike_exists
      post_dislike_exists.destroy
    end
    post_like = PostLike.create(post_like_params)
    puts "++++++++++++++++++++++++++++++++++++++++"
    puts post_like
    puts "++++++++++++++++++++++++++++++++++++++++"
    render json: PostSerializer.new(post_like.post).to_serialized_json
  end

  def destroy
    post_like = PostLike.find_by(id: params[:id])
    post = post_like.post
    post_like.destroy
    render json: PostSerializer.new(post).to_serialized_json
  end

  private
  def post_like_params
    params.require(:post_like).permit(:user_id, :post_id)
  end

end
