class Api::V1::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
      post.create_notification_comment!(current_user, comment.id)
      render json: { status: 'success', comment: comment }
    else
      render json: {
        status: 'error',
        errors: comment.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    if comment&.destroy
      render json: { status: 'success' }
    else
      render json: {
        status: 'error',
        errors: ['Comment not found or could not be deleted.']
      }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end