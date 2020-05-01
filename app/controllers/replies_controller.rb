class RepliesController < ApplicationController
  # skip_before_action :authorized, only: [:index, :show]

  def create
    reply = Reply.create(reply_params)
    render json: CommentSerializer.new(reply.comment).to_serialized_json
  end

  def update
    reply = Reply.find_by(id: params[:id])
    reply.update_attributes(reply_params)
    render json: CommentSerializer.new(reply.comment).to_serialized_json
  end

  def destroy
    reply = Reply.find_by(id: params[:id])
    comment = reply.comment
    reply.destroy
    render json: CommentSerializer.new(comment).to_serialized_json
  end
  private
  def reply_params
    params.require(:reply).permit( :message, :user_id, :comment_id)
  end
end
