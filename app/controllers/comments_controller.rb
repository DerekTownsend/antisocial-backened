class CommentsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    comments = Comment.all
    render json: CommentSerializer.new(comments.to_a).to_serialized_json
  end

  def show
    comment = Comment.find_by(id: params[:id])

    # total: post.comments.count
    render json:  CommentSerializer.new(comment,comment.replies.count).to_serialized_json
  end

  def create
    comment = Comment.create(comment_params)
    render json: CommentSerializer.new(comment).to_serialized_json
  end

  def update
    comment = Comment.find_by(id: params[:id])
    comment.update_attributes(comment_params)
    render json: CommentSerializer.new(comment).to_serialized_json
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    render json: {message: "success"}
  end
  private
  def comment_params
    params.require(:comment).permit( :message, :user_id, :post_id)
  end
end
